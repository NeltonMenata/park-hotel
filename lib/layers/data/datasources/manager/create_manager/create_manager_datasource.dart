import 'package:park_hotel/layers/domain/entities/manager/manager_entity.dart';

abstract class ICreateManagerDataSource {
  Future<ManagerEntity> call(ManagerEntity manager);
}
