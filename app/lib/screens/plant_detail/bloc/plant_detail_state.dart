part of 'plant_detail_bloc.dart';

@immutable
abstract class PlantDetailState extends Equatable {
  const PlantDetailState();

  @override
  List<Object> get props => [];
}

class PlantDetailInitial extends PlantDetailState {}

class GetPlantDetailSuccess extends PlantDetailState {
  final PlantDetail plantDetail;

  const GetPlantDetailSuccess({required this.plantDetail});
}

class GetPlantDetailFailure extends PlantDetailState {
  final Exception e;

  const GetPlantDetailFailure({required this.e});
}
