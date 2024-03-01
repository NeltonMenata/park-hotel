import 'package:park_hotel/layers/domain/entities/event/event_entity.dart';
import 'package:park_hotel/layers/domain/usecases/event/get_all_event_usecase/get_all_event_usecase.dart';
import 'package:park_hotel/layers/presenter/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class ManagerEventController {
  ManagerEventController(this._getAllEventUseCase);
  final IGetAllEventUseCase _getAllEventUseCase;

  final List<EventEntity> _eventList = [];
  List<EventEntity> get eventList => _eventList;

  Future<List<EventEntity>> getAllEvent(BuildContext context,
      [String? workerObjectId]) async {
    try {
      return await _getAllEventUseCase(workerObjectId);
    } catch (e) {
      showResultCustom(
          context, "Erro ao carregar os eventos guardados: " + e.toString());
      return [];
    }
  }
}
