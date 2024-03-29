import 'package:park_hotel/layers/data/datasources/worker/worker_login/worker_login_datasource.dart';
import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';
import 'package:park_hotel/layers/domain/repositories/worker/worker_login/worker_login_repository.dart';

class WorkerLoginRepositoryImp implements IWorkerLoginRepository {
  final IWorkerLoginDataSource _workerLoginDataSource;
  WorkerLoginRepositoryImp(this._workerLoginDataSource);
  @override
  Future<WorkerEntity> call(String username, String password) async {
    return await _workerLoginDataSource(username, password);
  }
}
