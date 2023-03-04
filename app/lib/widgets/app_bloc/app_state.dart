part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class CamerasChecked extends AppState {
  
  final List<CameraDescription> cameras;

  const CamerasChecked({required this.cameras});

  @override
  List<Object> get props => [cameras];
}
