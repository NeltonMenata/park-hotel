import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';
import 'package:park_hotel/layers/domain/repositories/worker/worker_login/worker_login_repository.dart';
import 'package:park_hotel/layers/domain/usecases/worker/login/login_worker_usecase.dart';

class LoginWorkerUseCaseImp implements ILoginWorkerUseCase {
  final IWorkerLoginRepository _workerLoginRepository;
  LoginWorkerUseCaseImp(this._workerLoginRepository);
  @override
  Future<WorkerEntity> call(String username, String password) async {
    return await _workerLoginRepository(username, password);
  }
}
