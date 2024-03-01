import 'package:park_hotel/layers/data/datasources/worker/get_all_worker_in_event/get_all_worker_in_event_datasource.dart';
import 'package:park_hotel/layers/domain/entities/worker/worker_entity_minimal.dart';
import 'package:park_hotel/layers/domain/repositories/worker/get_all_worker_in_event/get_all_worker_in_event_repository.dart';

class GetAllWorkerInEventRepositoryImp
    implements IGetAllWorkerInEventRepository {
  final IGetAllWorkerInEventDataSource _getAllWorkerInEventDataSource;
  GetAllWorkerInEventRepositoryImp(this._getAllWorkerInEventDataSource);
  @override
  Future<List<WorkerEntityMinimal>> call(String eventObjectId) async {
    return await _getAllWorkerInEventDataSource(eventObjectId);
  }
}
