part of 'plants_bloc.dart';

abstract class PlantsState extends Equatable {
  const PlantsState();

  @override
  List<Object> get props => [];
}

class PlantsInitial extends PlantsState {}

class GetPlantsSuccess extends PlantsState {
  final List<Item> plants;

  const GetPlantsSuccess({required this.plants});

  // @override
  // List<Object> get props => [plants];
}

class GetPlantsFailure extends PlantsState {
  final String errorMessage;

  const GetPlantsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
