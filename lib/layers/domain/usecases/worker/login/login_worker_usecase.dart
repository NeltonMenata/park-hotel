import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';

abstract class ILoginWorkerUseCase {
  Future<WorkerEntity> call(String username, String password);
}
