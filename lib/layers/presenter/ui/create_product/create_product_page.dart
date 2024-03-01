import 'dart:math';
import 'package:park_hotel/layers/core/inject/inject.dart';
import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';
import 'package:park_hotel/layers/presenter/ui/create_product/create_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/components/text_field_custom/text_field_custom.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../domain/entities/event/event_entity.dart';
import '../../utils/utils.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final controller = getIt<CreateProductController>();
  final priceController = TextEditingController();
  final nameController = TextEditingController();
  bool isFavorite = false;
  //final List<ProductEntity> allProducts = [];
  bool isLoading = false;
  bool complete = true;
  bool isSave = false;
  @override
  Widget build(BuildContext context) {
    //final currentEvent = ModalRoute.of(context)?.settings.arguments as EventEntity;
    final width = MediaQuery.of(context).size.width;
    const allPadding = 4.0;
    final fontSize = width * .038;
    if (complete) {
      controller.getAllProduct("currentEvent.objectId").then(
        (value) {
          setState(() {
            controller.products.clear();
            controller.products.addAll(value);
            isLoading = false;
            complete = false;
          });
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Cria Novos Produtos", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Visibility(
                              visible: controller.products.isEmpty,
                              child: Text(
                                "Nenhum produto foi encontrado, crie um novo!",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * .08),
                              ),
                            ),
                            ...controller.products.map((e) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Color.fromRGBO(
                                            Random().nextInt(255),
                                            Random().nextInt(255),
                                            Random().nextInt(255),
                                            .8),
                                        radius: width * .05,
                                        child: Text(
                                          e.name![0].toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: width * .05),
                                        ),
                                      ),
                                      title: Text(
                                        e.name!.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: width * .04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(e.price.toString() + " kz",
                                              style: TextStyle(
                                                  fontSize: width * .04,
                                                  fontWeight: FontWeight.bold)),
                                          FutureBuilder<bool>(
                                              future: verifyFavoriteProduct(
                                                  "${e.objectId}"),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Container();
                                                } else if (snapshot.hasData) {
                                                  return snapshot.data == true
                                                      ? IconButton(
                                                          onPressed: () async {
                                                            setState(() {
                                                              addFavoriteProduct(
                                                                  "${e.objectId}",
                                                                  !snapshot
                                                                      .data!);
                                                            });
                                                          },
                                                          icon: const Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.red))
                                                      : IconButton(
                                                          onPressed: () async {
                                                            setState(() {
                                                              addFavoriteProduct(
                                                                  "${e.objectId}",
                                                                  !snapshot
                                                                      .data!);
                                                            });
                                                          },
                                                          icon: const Icon(Icons
                                                              .favorite_outline));
                                                } else {
                                                  return const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  );
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                    // const Divider(
                                    //   color: Colors.black54,
                                    // )
                                  ],
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      )),
            const Divider(
              height: 2,
              thickness: 1.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(allPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome do Produto",
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.w900),
                    ),
                    TextFieldCustom(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      icon: const Icon(Icons.fastfood_rounded),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(allPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preço do Produto",
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.w900),
                  ),
                  TextFieldCustom(
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    icon: const Icon(Icons.attach_money_outlined),
                  )
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(allPadding),
              child: isSave
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.isEmpty ||
                            priceController.text.isEmpty) {
                          showResultCustom(
                              context, "Preencha os campos corretamente!");
                          return;
                        }

                        setState(() {
                          isSave = !isSave;
                        });
                        final product = await controller.saveProduct(
                            ProductEntity(
                                price: int.parse(
                                  priceController.text,
                                ),
                                favorite: isFavorite,
                                eventObjectId: "currentEvent.objectId",
                                name:
                                    nameController.text.toLowerCase().trim()));
                        if (product.error != null) {
                          showResultCustom(context, product.error!,
                              isError: true);
                        } else {
                          controller.products.insert(0, product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Produto salvo com sucesso"),
                                shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.green),
                          );
                        }
                        setState(() {
                          nameController.text = "";
                          priceController.text = "";
                          isSave = !isSave;
                        });
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Salvar Produto",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: fontSize, color: Colors.deepOrange),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> addFavoriteProduct(String objectId, bool isFavorite) async {
    final parseProduct = await ParseCloudFunction("addFavoriteProduct").execute(
        parameters: {"productObjectId": objectId, "isFavorite": isFavorite});

    return parseProduct.result["favorite"] ?? false;
  }

  Future<bool> verifyFavoriteProduct(String objectId) async {
    final parseProduct = await ParseCloudFunction("verifyFavoriteProduct")
        .execute(parameters: {"productObjectId": objectId});
    return parseProduct.result["favorite"] ?? false;
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
  }
}
