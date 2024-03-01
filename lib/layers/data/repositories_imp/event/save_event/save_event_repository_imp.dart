import 'package:park_hotel/layers/data/datasources/event/save_event_datasource.dart';
import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';
import '../../../../domain/repositories/event/save_event/save_event_repository.dart';

class SaveEventRepositoryImp implements ISaveEventRepository {
  final ISaveEventDataSource _saveEventDataSource;

  SaveEventRepositoryImp(this._saveEventDataSource);

  @override
  Future<EventEntity> call(EventEntity event) async {
    return await _saveEventDataSource(event);
  }
}
