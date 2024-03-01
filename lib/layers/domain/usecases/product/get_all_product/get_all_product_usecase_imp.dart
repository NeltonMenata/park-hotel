import 'package:park_hotel/layers/domain/entities/product/product_entity.dart';
import 'package:park_hotel/layers/domain/repositories/product/get_all_product/get_all_product_repository.dart';
import 'package:park_hotel/layers/domain/usecases/product/get_all_product/get_all_product_usecase.dart';

class GetAllProductUseCaseImp implements IGetAllProductUseCase {
  final IGetAllProductRepository _getAllProductRepository;
  GetAllProductUseCaseImp(this._getAllProductRepository);
  @override
  Future<List<ProductEntity>> call(String eventObjectId) async {
    return await _getAllProductRepository(eventObjectId);
  }
}
