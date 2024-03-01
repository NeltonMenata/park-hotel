import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';

abstract class ISaveEventUseCase {
  Future<EventEntity> call(EventEntity event);
}
