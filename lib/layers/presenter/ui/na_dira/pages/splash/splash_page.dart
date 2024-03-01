import 'package:flutter/material.dart';
import 'package:park_hotel/layers/presenter/ui/na_dira/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
        () => {Navigator.pushReplacementNamed(context, Routes.HOME)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/images/logo.png", height: 100, width: 100,)),
            Text(
              "na Dira",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Text(
              "Faça vendas rápida e grátis!!",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
            ),
            const SizedBox(height: 20,),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
