import 'package:park_hotel/layers/core/inject/inject.dart';
import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';
import 'package:park_hotel/layers/domain/usecases/guest/save_guest/save_guest_usecase.dart';

class AddGuestController {
  final _saveGuestUseCase = getIt<ISaveGuestUseCase>();

  Future<GuestEntity> saveGuest(GuestEntity guest) async {
    final guestResult = await _saveGuestUseCase(guest);
    return guestResult;
  }
}
