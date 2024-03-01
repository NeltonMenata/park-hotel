import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';

abstract class IGetAllEventDataSource {
  Future<List<EventEntity>> call([String? workerObjectId, String? managerObjectId]);
}
