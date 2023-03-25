import 'package:app/models/item.dart';
import 'package:app/repository/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pests_and_diseases_event.dart';
part 'pests_and_diseases_state.dart';

class PestsAndDiseasesBloc
    extends Bloc<PestsAndDiseasesEvent, PestsAndDiseasesState> {
  PestsAndDiseasesBloc() : super(PestsAndDiseasesInitial()) {
    on<PestsAndDiseasesEvent>((event, emit) async {
      if (event is GetPestsAndDiseasesEvent) {
        try {
          final List<Item> pests =
              await ApiRepository.pestAndDiseaseRepo.getPestList();
          final List<Item> diseases =
              await ApiRepository.pestAndDiseaseRepo.getDiseaseList();
          if (pests.isNotEmpty && diseases.isNotEmpty) {
            emit(GetPestsAndDiseasesSuccess(pests: pests, diseases: diseases));
          }
        } on Exception catch (e) {
          emit(GetPestsOrDiseasesFailure(e: e));
        }
      }
    });
  }
}
