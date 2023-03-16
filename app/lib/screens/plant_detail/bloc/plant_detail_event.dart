part of 'plant_detail_bloc.dart';

@immutable
abstract class PlantDetailEvent extends Equatable {
  const PlantDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPlantDetailEvent extends PlantDetailEvent {
  final String plantId;

  const GetPlantDetailEvent({required this.plantId});
}
