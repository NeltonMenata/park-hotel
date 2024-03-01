import 'package:park_hotel/layers/domain/entities/manager/manager_entity.dart';

abstract class ILoginManagerUseCase {
  Future<ManagerEntity> call(String username, String password);
}
