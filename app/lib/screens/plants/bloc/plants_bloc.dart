import 'package:app/models/item.dart';
import 'package:app/repository/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plants_event.dart';
part 'plants_state.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  PlantsBloc() : super(PlantsInitial()) {
    on<GetPlantsEvent>((event, emit) async {
      try {
        final List<Item> results =
            await ApiRepository.productPlantsRepo.getPlantList();
        if (results.isNotEmpty) {
          emit(GetPlantsSuccess(plants: results));
        }
      } on Exception catch (e) {
        emit(GetPlantsFailure(errorMessage: e.toString()));
      }
    });
  }
}
