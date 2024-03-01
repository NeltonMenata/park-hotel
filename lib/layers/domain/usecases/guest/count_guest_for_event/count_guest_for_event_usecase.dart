import 'package:park_hotel/layers/domain/entities/report_guest/report_guest_entity.dart';

abstract class ICountGuestForEventUseCase {
  Future<ReportGuestEntity> call(String eventObjectId);
}
