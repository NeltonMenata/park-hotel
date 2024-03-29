import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';
import 'package:park_hotel/layers/domain/usecases/guest/get_guest_for_objectId_usecase/get_guest_entity_for_objectId.dart';
import 'package:park_hotel/layers/domain/usecases/guest/save_guest/save_guest_usecase.dart';

class RegisterInOrOutGuestController {
  final ISaveGuestUseCase _saveGuest;
  final IGetGuestForObjectIdUseCase _getGuestForObjectIdUseCase;

  RegisterInOrOutGuestController(
      this._saveGuest, this._getGuestForObjectIdUseCase);

  Future<GuestEntity> saveGuest(GuestEntity _guestEntity) async {
    return await _saveGuest(_guestEntity);
  }

  Future<GuestEntity> getGuest(String objectId, String eventObjectId) async {
    return await _getGuestForObjectIdUseCase(objectId, eventObjectId);
  }
}
