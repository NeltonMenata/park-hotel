import 'package:park_hotel/layers/data/datasources/worker/create_worker/create_worker_datasource.dart';
import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';
import 'package:park_hotel/layers/domain/repositories/worker/create_worker/create_worker_repository.dart';

class CreateWorkerRepositoryImp implements ICreateWorkerRepository {
  final ICreateWorkerDataSource _createWorkerDataSource;
  CreateWorkerRepositoryImp(this._createWorkerDataSource);
  @override
  Future<WorkerEntity> call(WorkerEntity worker) async {
    return await _createWorkerDataSource(worker);
  }
}
