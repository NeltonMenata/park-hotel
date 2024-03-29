import 'package:park_hotel/layers/domain/entities/worker/worker_entity_minimal.dart';
import 'package:park_hotel/layers/domain/repositories/worker/get_all_worker_in_event/get_all_worker_in_event_repository.dart';
import 'package:park_hotel/layers/domain/usecases/worker/get_all_worker_in_event/get_all_worker_in_event_usecase.dart';

class GetAllWorkerInEventUseCaseImp implements IGetAllWorkerInEventUseCase {
  final IGetAllWorkerInEventRepository _getAllWorkerInEventRepository;
  GetAllWorkerInEventUseCaseImp(this._getAllWorkerInEventRepository);
  @override
  Future<List<WorkerEntityMinimal>> call(String eventObjectId) async {
    return await _getAllWorkerInEventRepository(eventObjectId);
  }
}
