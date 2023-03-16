import 'package:app/models/plant_detail.dart';
import 'package:app/repository/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'plant_detail_event.dart';
part 'plant_detail_state.dart';

class PlantDetailBloc extends Bloc<PlantDetailEvent, PlantDetailState> {
  PlantDetailBloc() : super(PlantDetailInitial()) {
    on<GetPlantDetailEvent>((event, emit) async {
      try {
        final PlantDetail plantDetail =
            await ApiRepository.plantsRepo.getPlantDetail(event.plantId);
        emit(GetPlantDetailSuccess(plantDetail: plantDetail));
      } on Exception catch (e) {
        emit(GetPlantDetailFailure(e: e));
      }
    });
  }
}
