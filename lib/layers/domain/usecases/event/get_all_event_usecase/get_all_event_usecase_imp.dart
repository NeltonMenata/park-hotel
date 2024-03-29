import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';
import 'package:park_hotel/layers/domain/usecases/event/get_all_event_usecase/get_all_event_usecase.dart';
import '../../../repositories/event/get_all_event_repository/get_all_event_repository.dart';

class GetAllEventUseCaseImp implements IGetAllEventUseCase {
  final IGetAllEventRepository _getAllEventRepository;
  GetAllEventUseCaseImp(this._getAllEventRepository);
  @override
  Future<List<EventEntity>> call(
      [String? workerObjectId, String? managerObjectId]) async {
    return await _getAllEventRepository(workerObjectId, managerObjectId);
  }
}
