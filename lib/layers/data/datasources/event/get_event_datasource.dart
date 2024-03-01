import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';

abstract class IGetEventDataSource {
  Future<EventEntity> call(String eventObjectId);
}
