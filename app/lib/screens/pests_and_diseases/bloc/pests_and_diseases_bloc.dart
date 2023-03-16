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
    on<GetDiseasesEvent>((event, emit) async {
      try {
        final List<Item> result =
            await ApiRepository.pestAndDiseaseRepo.getDiseaseList();
        if (result.isNotEmpty) {
          emit(GetDiseasesSuccess(diseases: result));
        }
      } on Exception catch (e) {
        emit(GetDiseasesFailure(errorMessage: e.toString()));
      }
    });
  }
}
