import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';

abstract class IWorkerLoginDataSource {
  Future<WorkerEntity> call(String username, String password);
}
