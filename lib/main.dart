import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:park_hotel/layers/core/inject/inject.dart';
import 'package:park_hotel/layers/data/datasources/back4app/back4app_core_connection/back4app.dart';
import 'package:park_hotel/my_app/my_app.dart';
import 'firebase_options.dart';
//950 654 895

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
   );
  await Back4app.initialize();
  initInject();
  runApp(const MyApp());
}