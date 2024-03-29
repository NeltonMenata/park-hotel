import 'package:park_hotel/layers/data/datasources/product/save_product_datasource.dart';
import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';
import 'package:park_hotel/layers/domain/repositories/product/save_product/save_product_repository.dart';

class SaveProductRepositoryImp implements ISaveProductRepository {
  final ISaveProductDataSource _saveProductDataSource;

  SaveProductRepositoryImp(this._saveProductDataSource);
  @override
  Future<ProductEntity> call(ProductEntity product) async {
    return await _saveProductDataSource(product);
  }
}
