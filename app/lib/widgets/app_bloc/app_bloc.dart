import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<CheckCameras>((event, emit) async {
      // TODO: implement event handler
      final cameras = await availableCameras();
      print('cameras length: ${cameras.length}');
      if (cameras.isNotEmpty) {
        emit(CamerasChecked(cameras: cameras));
      }
    });
  }
}
