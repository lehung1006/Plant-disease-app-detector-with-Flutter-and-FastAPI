import 'package:app/models/item.dart';
import 'package:app/models/pest_detection.dart';
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
          final Item item = await ApiRepository.plantsRepo
              .getPlantClassifyResult(event.imgBase64);
          emit(GetClassifyResultSuccess(item: item));
        } on Exception catch (e) {
          emit(GetClassifyResultFailure(e: e));
        }
      } else if (event is GetPestDetectionResultEvent) {
        try {
          final PestDetection pestDetection = await ApiRepository
              .pestAndDiseaseRepo
              .getPestDetectionResult(event.imgBase64);
          emit(GetPestDetectionResultSuccess(pestDetection: pestDetection));
        } on Exception catch (e) {
          emit(GetClassifyResultFailure(e: e));
        }
      }
    });
  }
}
