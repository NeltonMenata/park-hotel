import 'package:park_hotel/layers/data/datasources/mock/database_mock.dart';
import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';

import '../guest/save_guest_datasource.dart';

class SaveGuestDataSourceMockImp implements ISaveGuestDataSource {
  final List<GuestEntity> list = [];

  @override
  Future<GuestEntity> call(GuestEntity guestEntity) async {
    DataBaseMock.listGuestEntity.add(guestEntity);
    return DataBaseMock.listGuestEntity.last;
  }
}
