import 'package:park_hotel/layers/domain/entities/report_sale/report_sale_entity.dart';

abstract class IGetAllSaleForEventUseCase {
  Future<List<ReportSaleEntity>> call(String eventObjectId);
}
