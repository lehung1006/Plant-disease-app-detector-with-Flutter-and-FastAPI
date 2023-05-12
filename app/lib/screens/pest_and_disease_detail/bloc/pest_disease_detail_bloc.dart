import 'package:app/models/pest_and_disease_detail.dart';
import 'package:app/repository/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pest_disease_detail_event.dart';
part 'pest_disease_detail_state.dart';

class PestDiseaseDetailBloc
    extends Bloc<PestDiseaseDetailEvent, PestDiseaseDetailState> {
  PestDiseaseDetailBloc() : super(PestDiseaseDetailInitial()) {
    on<PestDiseaseDetailEvent>((event, emit) async {
      try {
        if (event is GetDiseaseDetailEvent) {
          final result =
              await ApiRepository.pestAndDiseaseRepo.getDiseaseDetail(event.id);
          emit(GetDiseaseDetailSuccess(result: result));
        } else {
          final result = await ApiRepository.pestAndDiseaseRepo
              .getPestDetail((event as GetPestDetailEvent).id);
          emit(GetDiseaseDetailSuccess(result: result));
        }
      } on Exception catch (e) {
        emit(GetDetailDataFaild(e: e));
      }
    });
  }
}
