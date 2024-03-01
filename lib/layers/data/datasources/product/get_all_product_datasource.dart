import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';

abstract class IGetAllProductDataSource {
  Future<List<ProductEntity>> call(String eventObjectId);
}
