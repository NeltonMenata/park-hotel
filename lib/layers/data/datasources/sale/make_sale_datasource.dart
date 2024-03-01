import 'package:park_hotel/layers/domain/entities/sale/sale_entity.dart';

abstract class IMakeSaleDataSource {
  Future<SaleEntity> call(SaleEntity sale);
}
