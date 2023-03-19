part of 'floating_action_button_bloc.dart';

@immutable
abstract class FloatingActionButtonEvent extends Equatable {
  const FloatingActionButtonEvent();

  @override
  List<Object> get props => [];
}


class PlantIdentificationTap extends FloatingActionButtonEvent {}

class PestIdentificationTap extends FloatingActionButtonEvent {}

class DiseaseIdentificationTap extends FloatingActionButtonEvent {}