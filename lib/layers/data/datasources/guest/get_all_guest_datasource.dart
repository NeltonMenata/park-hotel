import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';

abstract class IGetAllGuestDataSource {
  Future<List<GuestEntity>> call();
}
