import 'package:park_hotel/layers/core/inject/inject.dart';
import 'package:park_hotel/layers/presenter/ui/add_guest/add_guest_controller.dart';
import 'package:park_hotel/layers/presenter/ui/login/login_controller.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/components/text_field_custom/text_field_custom.dart';
import 'package:park_hotel/layers/presenter/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/event/event_entity.dart';
import '../../../domain/entities/guest/guest_entity.dart';

class AddGuestPage extends StatefulWidget {
  const AddGuestPage({Key? key}) : super(key: key);

  @override
  State<AddGuestPage> createState() => _AddGuestPageState();
}

class _AddGuestPageState extends State<AddGuestPage> {
  final contactController = TextEditingController();
  final nameController = TextEditingController();
  final controller = getIt<AddGuestController>();

  bool isSave = false;
  bool isVip = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSizeTitle = width * .045;
    final workerObjectId = currentWorker?.objectId;
    //final currentEvent = ModalRoute.of(context)?.settings.arguments as EventEntity;
    //double fontSizeSubtitle = width * .035;
    const allPadding = 8.0;
    final fontSize = width * .04;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, right: 8, left: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Adicione Pessoas ao Evento",
                      style: TextStyle(
                          fontFamily: "Arial Black",
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeTitle * 1.35),
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Nome",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: TextFieldCustom(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            icon: const Icon(Icons.person),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Contacto",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFieldCustom(
                          controller: contactController,
                          keyboardType: TextInputType.phone,
                          icon: const Icon(Icons.phone),
                          letterSpacing: 5,
                              wordSpacing: 3,
                              //maxLength: 9,
                          ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: isSave
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    if (nameController.text.isEmpty ||
                                        contactController.text.isEmpty ||
                                        contactController.text.length < 9) {
                                      showResultCustom(context,
                                          "Preencha os campos corretamente!");
                                      return;
                                    }

                                    setState(() {
                                      isSave = !isSave;
                                    });

                                    final guestSaved =
                                        await controller.saveGuest(
                                      GuestEntity(
                                          contact: contactController.text,
                                          name: nameController.text,
                                          objectId: "objectId",
                                          isIn: false,
                                          isVip: false,
                                          eventObjectId: "currentEvent.objectId",
                                          workerObjectId: workerObjectId),
                                    );

                                    setState(() {
                                      nameController.text = "";
                                      contactController.text = "";

                                      isSave = !isSave;
                                    });
                                    if (guestSaved.error != null) {
                                      showResultCustom(
                                          context, guestSaved.error!,
                                          isError: true);
                                      return;
                                    }
                                    Navigator.of(context).pop(guestSaved);
                                  },
                                  child: Text(
                                    "Salvar Convidado",
                                    style: TextStyle(fontSize: fontSize, color: Colors.deepOrange),
                                  ),
                                )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _styleTextField(bool isPhone) => InputDecoration(
        hintText: "Digite aqui",
        hintStyle: const TextStyle(color: Colors.black, letterSpacing: 0),
        border: const OutlineInputBorder(),
        suffixIcon: Icon(
          isPhone ? Icons.phone_outlined : Icons.person_outline_rounded,
        ),
      );
}
