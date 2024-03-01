import 'package:park_hotel/layers/core/inject/inject.dart';
import '../../../domain/usecases/guest/done_in_or_out_guest/done_in_or_out_guest.dart';

mixin DoneInOrOutGuestMixin {
  final _doneInOrOutGuestUseCase = getIt<IDoneInOrOutGuestUseCase>();
  Future<bool> doneInOrOutGuest(String objectId, bool inOrOut) async {
    return await _doneInOrOutGuestUseCase(objectId, inOrOut);
  }
}
