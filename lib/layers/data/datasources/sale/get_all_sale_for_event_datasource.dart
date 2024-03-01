import 'package:park_hotel/layers/domain/entities/report_sale/report_sale_entity.dart';

abstract class IGetAllSaleForEventDataSource {
  Future<List<ReportSaleEntity>> call(String eventObjectId);
}
