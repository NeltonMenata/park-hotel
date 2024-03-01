import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';

abstract class IGetAllProductRepository {
  Future<List<ProductEntity>> call(String eventObjectId);
}
