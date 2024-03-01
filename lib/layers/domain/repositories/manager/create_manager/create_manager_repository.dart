import 'package:park_hotel/layers/domain/entities/manager/manager_entity.dart';

abstract class ICreateManagerRepository {
  Future<ManagerEntity> call(ManagerEntity manager);
}
