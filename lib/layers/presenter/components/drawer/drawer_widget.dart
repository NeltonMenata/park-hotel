import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Drawer(
      child: Column(
                          children: [
                            UserAccountsDrawerHeader(
                              accountName: Text(
                                 "Not connected",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade900),
                              ),
                              accountEmail: Text("Gerente", style: TextStyle(color: Colors.grey.shade900),),
                              currentAccountPicture: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const CircleAvatar()),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Criar Barman",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * .04,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.group_add_outlined,
                                        size: width * .10,
                                      ),
                                      onTap: () {
                                        
                                      },
                                    ),
                                    const Text(
                                      "Suporte e Ajuda",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Arial Black"),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Facebook",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * .04,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.facebook_outlined,
                                        size: width * .10,
                                      ),
                                      onTap: () async {
                                        // final uri = Uri.parse(
                                        //     "https://www.facebook.com/profile.php?id=100077996632399");
                                        // await launchUrl(uri,
                                        //     mode: LaunchMode.externalApplication);
                                      },
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Youtube",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * .04,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.video_library_rounded,
                                        size: width * .10,
                                      ),
                                      onTap: () async {
                                        // final uri = Uri.parse(
                                        //     "https://youtube.com/playlist?list=PLtv_rjcck_Gzrm4fM-w2rrr1KMvVXgX9Z&si=QwOxci_5oarMbU8e");
                                        // await launchUrl(uri,
                                        //     mode: LaunchMode.externalApplication);
                                      },
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Actualizar",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * .04,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.system_update_alt_outlined,
                                        size: width * .10,
                                      ),
                                      onTap: () async {
                                      //   final uri = Uri.parse(
                                      //       "https://drive.google.com/file/d/1A0iyCXB06k6VjLeeQaW3l_tKgkN8Ntx2/view?usp=drive_link");
                                      //   await launchUrl(uri,
                                      //       mode: LaunchMode.externalApplication);
                                       },
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Sobre",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * .04,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.priority_high_rounded,
                                        size: width * .10,
                                      ),
                                      onTap: () {
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Terminar Sessão",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: width * .04,
                                ),
                              ),
                              trailing: Icon(
                                Icons.logout_outlined,
                                color: Colors.red,
                                size: width * .10,
                              ),
                              onTap: () async {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Terminando a sessão. Aguarde!"),
                                ));
                                Navigator.pop(context);
      },
                            ),
                          ],
                        ),
    );
                    
  }
}