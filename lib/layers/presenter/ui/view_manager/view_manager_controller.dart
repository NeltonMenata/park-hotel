import 'package:park_hotel/layers/domain/entities/manager/manager_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ViewManagerController {
  Future<List<ManagerEntity>> getManagers() async {
    final manager = ParseCloudFunction("getAllManager");
    final result = await manager.execute();
    final List<ManagerEntity> listManager = [];

    result.result?.forEach((manager) {
      listManager.add(
          ManagerEntity(username: manager["phone"], name: manager["name"]));
    });
    return listManager;
  }
}
