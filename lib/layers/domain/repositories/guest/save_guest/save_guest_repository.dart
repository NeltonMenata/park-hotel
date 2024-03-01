import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';

abstract class ISaveGuestRepository {
  Future<GuestEntity> call(GuestEntity guestEntity);
}
