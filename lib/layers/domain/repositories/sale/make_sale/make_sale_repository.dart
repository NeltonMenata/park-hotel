import 'package:park_hotel/layers/domain/entities/sale/sale_entity.dart';

abstract class IMakeSaleRepository {
  Future<SaleEntity> call(SaleEntity sale);
}
