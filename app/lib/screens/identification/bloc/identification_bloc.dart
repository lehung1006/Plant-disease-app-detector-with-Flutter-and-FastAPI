import 'package:app/models/classify_result.dart';
import 'package:app/models/history_item.dart';
import 'package:app/models/item.dart';
import 'package:app/models/pest_detection_result.dart';
import 'package:app/repository/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'identification_event.dart';
part 'identification_state.dart';

class IdentificationBloc
    extends Bloc<IdentificationEvent, IdentificationState> {
  IdentificationBloc() : super(IdentificationInitial()) {
    on<IdentificationEvent>((event, emit) async {
      if (event is GetClassifyResultEvent) {
        try {
          final ClassifyResult result = await ApiRepository.plantsRepo
              .getPlantClassifyResult(event.imgBase64);
          emit(GetClassifyResultSuccess(result: result));
          if (result is ClassifySuccessResult) {
            ApiRepository.identifyHistoryRepo.saveClassifyHistory(result);
          }
        } on Exception catch (e) {
          emit(GetClassifyResultFailure(e: e));
        }
      } else if (event is GetPestDetectionResultEvent) {
        try {
          final PestDetectionResult result = await ApiRepository
              .pestAndDiseaseRepo
              .getPestDetectionResult(event.imgBase64);
          emit(GetPestDetectionResultSuccess(pestDetectionResult: result));
          ApiRepository.identifyHistoryRepo.saveDetectionHistory(result);
        } on Exception catch (e) {
          emit(GetClassifyResultFailure(e: e));
        }
      } else if (event is IdentifyResetEvent) {
        emit(IdentificationInitial());
      } else if (event is GetIdentifyHistoryListEvent) {
        try {
          final List<HistoryItem> result =
              await ApiRepository.identifyHistoryRepo.getHistoryList();
          emit(GetIdentifyHistoryListSuccess(historyList: result));
        } on Exception catch (e) {
          emit(GetIdentifyHistoryListFailure(e: e));
        }
      } else if (event is GetIdentifyHistoryDetailEvent) {
        try {
          final detail = await ApiRepository.identifyHistoryRepo
              .getIdentifyHistoryDetail(event.key, event.type);
          if (event.type == 1) {
            emit(GetPestDetectionResultSuccess(
                pestDetectionResult: detail as PestDetectionResult));
          } else {
            emit(GetClassifyResultSuccess(result: detail as ClassifyResult));
          }
        } on Exception catch (e) {
          if (event.type == 1) {
            emit(GetPestDetectionResultFailure(e: e));
          } else {
            emit(GetClassifyResultFailure(e: e));
          }
        }
      } else if (event is ClearAllHistoryEvent) {
        try {
          ApiRepository.identifyHistoryRepo.clearAllHistory();
        } on Exception {
          rethrow;
        }
      }
    });
  }
}
