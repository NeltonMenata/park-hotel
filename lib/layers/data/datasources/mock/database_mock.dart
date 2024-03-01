import 'package:park_hotel/layers/domain/entities/guest/guest_entity.dart';

import '../../../domain/entities/event/event_entity.dart';

abstract class DataBaseMock {
  static final List<EventEntity> listEventEntity = [];
  static final List<GuestEntity> listGuestEntity = [];
}
