import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';

abstract class IGetEventUseCase {
  Future<EventEntity> call(String eventObjectId);
}
