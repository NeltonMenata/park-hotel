import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';

abstract class ICreateWorkerRepository {
  Future<WorkerEntity> call(WorkerEntity worker);
}
