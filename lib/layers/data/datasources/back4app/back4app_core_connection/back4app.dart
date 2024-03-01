// ignore_for_file: prefer_const_declarations
import 'package:parse_server_sdk/parse_server_sdk.dart';

abstract class Back4app {
  static Future<void> initialize() async {

    final keyApplicationId = "A0qBDhT7sQzfhCwQdRa8kKFz1ivTXbacTThLZsTY";
    final keyClientKey = "SMQRedZ08PfdmT4PSdNbAhSBb0ibV2UMVMxEY4Sq";
    final keyParseServerUrl = "https://parseapi.back4app.com";
    final liveQueryUrl = "https://apupueventos.b4a.io";

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      liveQueryUrl: liveQueryUrl,
    );
  }
}
