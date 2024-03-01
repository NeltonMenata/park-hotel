import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';

abstract class ISaveProductRepository {
  Future<ProductEntity> call(ProductEntity product);
}
