import 'package:park_hotel/layers/domain/entities/report_credit/report_credit_entity.dart';

abstract class IGetAllCreditForEventDataSource {
  Future<List<ReportCreditEntity>> call(String eventObjectId);
}
