import 'package:park_hotel/layers/data/datasources/guest/save_guest_datasource.dart';
import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';
import '../../../../domain/repositories/guest/save_guest/save_guest_repository.dart';

class SaveGuestRepositoryImp implements ISaveGuestRepository {
  final ISaveGuestDataSource _saveGuestDataSource;
  SaveGuestRepositoryImp(this._saveGuestDataSource);

  @override
  Future<GuestEntity> call(GuestEntity guestEntity) {
    return _saveGuestDataSource(guestEntity);
  }
}
