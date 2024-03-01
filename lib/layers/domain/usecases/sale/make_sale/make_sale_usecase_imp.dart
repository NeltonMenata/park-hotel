import 'package:park_hotel/layers/domain/entities/sale/sale_entity.dart';
import 'package:park_hotel/layers/domain/repositories/sale/make_sale/make_sale_repository.dart';
import 'package:park_hotel/layers/domain/usecases/sale/make_sale/make_sale_usecase.dart';

class MakeSaleUseCaseImp implements IMakeSaleUseCase {
  final IMakeSaleRepository _makeSaleRepository;
  MakeSaleUseCaseImp(this._makeSaleRepository);
  @override
  Future<SaleEntity> call(SaleEntity sale) async {
    return await _makeSaleRepository(sale);
  }
}
