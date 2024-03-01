import 'package:park_hotel/layers/data/datasources/event/get_event_datasource.dart';
import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';
import 'package:park_hotel/layers/domain/repositories/event/get_event/get_event_repository.dart';

class GetEventRepositoryImp implements IGetEventRepository {
  final IGetEventDataSource _getEventDataSource;

  GetEventRepositoryImp(this._getEventDataSource);
  @override
  Future<EventEntity> call(String eventObjectId) async {
    return await _getEventDataSource(eventObjectId);
  }
}
