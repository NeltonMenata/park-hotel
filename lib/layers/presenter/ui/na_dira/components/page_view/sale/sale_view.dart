import 'package:flutter/material.dart';
import 'package:park_hotel/layers/presenter/components/button/button_widget.dart';
import 'package:park_hotel/layers/presenter/components/space/height_widget.dart';
import 'package:park_hotel/layers/presenter/components/space/width_widget.dart';
import 'package:park_hotel/layers/presenter/routes/Routes.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/pages/sale/sale_page.dart';

class SaleView extends StatelessWidget {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Bem-vindo ao app Park Hotel, o seu aplicativo de vendas rápidas",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Realize vendas de seus produtos',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    ButtonWidget(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.MAKE_SALE);
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> const SalePage()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Venda',
                              style: TextStyle(
                                  fontSize: 26, color: Colors.deepOrange),
                            ),
                            WidthWidget(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.deepOrange,
                            )
                          ],
                        )),
                  ],
                ),
              ),
              const HeightWidget(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Adicione dinheiro aos consumidores do Park Hotel',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    ButtonWidget(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.MAKE_CREDIT);
                        },
                        color: Colors.deepOrange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Crédito',
                              style: TextStyle(
                                  fontSize: 26, color: Colors.grey.shade300),
                            ),
                            const WidthWidget(),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.grey.shade300)
                          ],
                        )),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
