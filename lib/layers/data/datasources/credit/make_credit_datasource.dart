import 'package:park_hotel/layers/domain/entities/credit/credit_entity.dart';

abstract class IMakeCreditDataSource {
  Future<CreditEntity> call(CreditEntity credit);
}
