import 'package:flutter/material.dart';
import 'package:park_hotel/layers/presenter/components/button/button_widget.dart';
import 'package:park_hotel/layers/presenter/components/space/height_widget.dart';
import 'package:park_hotel/layers/presenter/components/text_field_custom/text_field_custom.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Center(
              child: Text("Adicione um Produto",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            const HeightWidget(16),
            const Text("Nome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const TextFieldCustom(
                icon: Icon(Icons.emoji_food_beverage_rounded)),
            const HeightWidget(),
            const Text(
              "Preço",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const TextFieldCustom(icon: Icon(Icons.attach_money_rounded)),
            const HeightWidget(24),
            ButtonWidget(
              expanded: true,
              onPressed: () async {},
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20,
                    
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
