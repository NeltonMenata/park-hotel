import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';
import 'package:park_hotel/layers/domain/repositories/product/get_all_product/get_all_product_repository.dart';

import '../../../datasources/product/get_all_product_datasource.dart';

class GetAllProductRepositoryImp implements IGetAllProductRepository {
  final IGetAllProductDataSource _getAllProductDataSource;
  GetAllProductRepositoryImp(this._getAllProductDataSource);

  @override
  Future<List<ProductEntity>> call(String eventObjectId) async {
    return await _getAllProductDataSource(eventObjectId);
  }
}
