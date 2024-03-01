import 'package:park_hotel/layers/domain/entities/worker/worker_entity.dart';
import 'package:park_hotel/layers/domain/usecases/worker/create_worker/create_worker_usecase.dart';
import 'package:park_hotel/layers/presenter/utils/utils.dart';
import 'package:flutter/material.dart';

class CreateWorkerController {
  final ICreateWorkerUseCase _createWorkertUseCase;

  CreateWorkerController(this._createWorkertUseCase);

  Future<void> createWorker(
    BuildContext context, {
    required String name,
    required String username,
    required String password,
    required bool isDoorman,
  }) async {
    final result = await _createWorkertUseCase(WorkerEntity(
        objectId: "",
        name: name.trim(),
        username: username.trim(),
        password: password.trim(),
        isDoorman: isDoorman));
    if (result.error != null) {
      showResultCustom(context, result.error!, isError: true);
    } else {
      showResultCustom(context, "Trabalhador Salvo com sucesso");
    }
  }
}
