import 'package:park_hotel/layers/data/datasources/guest/done_in_or_out_guest_datasource.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class DoneInOrOutGuestDatasourceBack4appImp
    implements IDoneInOrOutGuestDataSource {
  @override
  Future<bool> call(String objectId, bool inOrOut) async {
    try {
      final getOneGuest = ParseCloudFunction("doneInOrOutGuest");

      final result = await getOneGuest
          .execute(parameters: {"objectId": objectId, "inOrOut": inOrOut});

      return result.result["inOrOut"];
    } catch (e) {
      return false;
    }
  }
}
