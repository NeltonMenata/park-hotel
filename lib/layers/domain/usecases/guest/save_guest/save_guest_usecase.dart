import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';

abstract class ISaveGuestUseCase {
  Future<GuestEntity> call(GuestEntity entity);
}