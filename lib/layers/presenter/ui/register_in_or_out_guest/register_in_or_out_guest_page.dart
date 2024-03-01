import 'package:park_hotel/layers/core/inject/inject.dart';
import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';
import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';
import 'package:park_hotel/layers/presenter/routes/Routes.dart';
import 'package:park_hotel/layers/presenter/ui/login/login_controller.dart';
import 'package:park_hotel/layers/presenter/ui/mixins_controllers/done_in_or_out_guest_mixin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../utils/utils.dart';
import '../../utils/widget_to_image.dart';
import 'register_in_or_out_guest_controller.dart';

class RegisterInOrOutGuestPage extends StatefulWidget {
  RegisterInOrOutGuestPage({Key? key}) : super(key: key);

  final controller = getIt<RegisterInOrOutGuestController>();

  @override
  State<RegisterInOrOutGuestPage> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<RegisterInOrOutGuestPage>
    with DoneInOrOutGuestMixin {
  String title = "Gestão de Convidados";

  GlobalKey key1qrcode = GlobalKey();
  GlobalKey key2qrcode = GlobalKey();

  GuestEntity guestCurrent = GuestEntity(
      contact: "contact",
      name: "Nome",
      objectId: "objectId",
      isIn: false,
      eventObjectId: "",
      workerObjectId: "workerId");

  bool isIn = false;
  String statusGuest = "Convidado está fora";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //final currentEvent = ModalRoute.of(context)?.settings.arguments as EventEntity;

    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //const paddingLeft = 15.0;
    //const paddingBottom = 8.0;
    final fontSizeTitle = width * .05 * 1.35;
    final fontSizeGuest = width * .042;
    final fontSizeSubtitle = width * .049;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: MediaQuery.of(context).size.height * .01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeSubtitle),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: WidgetToImage(
                builder: (key) {
                  key1qrcode = key;
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.width * .8,
                    width: MediaQuery.of(context).size.width * .7,
                    child: guestCurrent.contact == "contact"
                        ? Center(
                            child: Text(
                              "Clique no botão ( + ) para adicionar consumidores.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                  fontSize: fontSizeSubtitle),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Center(
                                  child: QrImage(data: guestCurrent.objectId),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: width * .2,
                                child: Center(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width * .195,
                                          height: width * .155,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(Utils.assetLogo,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Visibility(
                                            visible: guestCurrent.isVip,
                                            child: const Icon(
                                              Icons.star,
                                              color: Colors.black,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4.0),
                                              child: Text(
                                                guestCurrent.name,
                                                style: TextStyle(
                                                    fontSize: fontSizeGuest,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ),
            Center(
              child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Limpar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    guestCurrent = GuestEntity(
                        contact: "contact",
                        name: "Nome",
                        objectId: "objectId",
                        isIn: false,
                        eventObjectId: "",
                        workerObjectId: "workerId");
                  });
                },
              ),
            ),
            const Spacer(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              final value = await Navigator.of(context).pushNamed(
                Routes.ADD_GUEST,
              );
              print("###############");
              print(value);
              if (value != null) {
                setState(() {
                  guestCurrent = value as GuestEntity;
                  isIn = false;
                  statusGuest = "O Convidado está fora do Evento";
                });

                print(guestCurrent.name);
                print(guestCurrent.objectId);
              }
            }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Utils.capture(
                          key1qrcode, context, guestCurrent.contact, true);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        Text(
                          " Qr Code",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                ElevatedButton(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Text(
                        "Convidados",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(Routes.SEARCH_GUEST, arguments: "currentEvent")
                        .then((value) {
                      setState(() {});
                    });
                  },
                )
              ]),
        ),
      ),
    );
  }
}
