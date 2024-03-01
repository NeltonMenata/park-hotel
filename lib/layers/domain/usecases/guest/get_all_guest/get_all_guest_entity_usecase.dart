import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';

abstract class IGetAllGuestUseCase {
  Future<List<GuestEntity>> call();
}
