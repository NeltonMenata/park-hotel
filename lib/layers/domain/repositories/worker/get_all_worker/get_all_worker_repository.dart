import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';

abstract class IGetAllWorkerRepository {
  Future<List<WorkerEntity>> call([String? managerObjectId]);
}
