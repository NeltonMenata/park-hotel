import 'package:park_hotel/layers/core/inject/inject.dart';
import 'package:park_hotel/layers/presenter/ui/login/login_controller.dart';
import 'package:park_hotel/layers/presenter/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../routes/Routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = getIt<LoginController>();
  bool isLogin = false;

  final username = TextEditingController();
  final password = TextEditingController();
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const paddingLeft = 15.0;
    final paddingTop = height * 0.07;
    const paddingBottom = 15.0;
    final fontSizeTitle = width * .08;
    final fontSizeTitleLabel = width * .045;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: paddingLeft, top: paddingTop, bottom: paddingBottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: Image.asset(
                        Utils.assetLogo,
                        height: width * 0.2,
                        width: width * 0.5,
                        fit: BoxFit.contain,
                      )),
                    ),
                    Text(
                      "Inicie sua Sessão",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: fontSizeTitle),
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.isAdmin ? "Gerente" : "Porteiro/Barman",
                      style: TextStyle(
                          fontSize: fontSizeTitleLabel,
                          fontWeight: FontWeight.w900),
                    ),
                    TextField(
                      controller: username,
                      keyboardType:
                          controller.isAdmin ? TextInputType.phone : null,
                      decoration: InputDecoration(
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: const OutlineInputBorder(),
                        hintText: controller.isAdmin ? "Telefone" : "Username",
                        suffixIcon: const Icon(Icons.person_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 12.0, left: 12.0, top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Senha",
                      style: TextStyle(
                          fontSize: fontSizeTitleLabel,
                          fontWeight: FontWeight.w900),
                    ),
                    TextField(
                      controller: password,
                      obscureText: hiddenPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Palavra-passe",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hiddenPassword = !hiddenPassword;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye_outlined)),
                      ),
                      onSubmitted: (value) {},
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          child: const Text(
                            "Esqueceu a palavra-passe?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
              TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Acessar como Gerente?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeTitleLabel * .9),
                    ),
                    Checkbox(
                      onChanged: (value) async {
                        setState(() {
                          controller.isAdmin = !controller.isAdmin;
                        });
                      },
                      value: controller.isAdmin,
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    controller.isAdmin = !controller.isAdmin;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 6, left: 10, right: 10, bottom: 6),
                child: isLogin
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        child: Text(
                          "Entrar no Sistema",
                          style: TextStyle(fontSize: fontSizeTitleLabel),
                        ),
                        onPressed: () async {
                          if (username.text.isEmpty || password.text.isEmpty) {
                            showResultCustom(
                                context, "Preencha os campos correctamente!",
                                isError: true);
                            return;
                          }
                          setState(() {
                            isLogin = true;
                          });
                          await controller.login(
                              context, username.text, password.text);

                          setState(() {
                            isLogin = false;
                          });
                        },
                      ),
              ),

              /*
              const Center(
                  child: Text("OU",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              */

              Padding(
                padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
                child: GestureDetector(
                  child: Center(
                    child: Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Colors.blue, fontSize: fontSizeTitleLabel),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.PHONE_NUMBER);
                    //Navigator.pushNamed(context, Routes.CREATE_MANAGER);
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
