import 'package:park_hotel/layers/data/datasources/sale/get_all_sale_for_event_datasource.dart';
import 'package:park_hotel/layers/domain/entities/report_sale/report_sale_entity.dart';
import 'package:park_hotel/layers/domain/repositories/sale/get_all_sale_for_event/get_all_sale_for_event_repository.dart';

class GetAllSaleForEventRepositoryImp implements IGetAllSaleForEventRepository {
  final IGetAllSaleForEventDataSource _getAllSaleForEventDataSource;

  GetAllSaleForEventRepositoryImp(this._getAllSaleForEventDataSource);

  @override
  Future<List<ReportSaleEntity>> call(String eventObjectId) async {
    return await _getAllSaleForEventDataSource(eventObjectId);
  }
}
