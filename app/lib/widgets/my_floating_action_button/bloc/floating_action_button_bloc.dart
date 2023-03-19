import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'floating_action_button_event.dart';
part 'floating_action_button_state.dart';

class FloatingActionButtonBloc
    extends Bloc<FloatingActionButtonEvent, FloatingActionButtonState> {
  int _type = 0;
  FloatingActionButtonBloc() : super(FloatingActionButtonInitial()) {
    on<FloatingActionButtonEvent>((event, emit) {
      switch(event.runtimeType) {
        case DiseaseIdentificationTap: {
          _type = 0;
          break;
        }
        case PestIdentificationTap: {
          _type = 1;
          break;
        }
        case PlantIdentificationTap: {
          _type = 2;
        }
      }
    });
  }

  int get type => _type;
  
  String getTitle() {
    switch(_type) {
      case 1: {
        return 'Nhận diện sâu bệnh';
      }
      case 2: {
        return 'Nhận diện cây';
      }
      default: {
        return 'Nhận diện bệnh';
      }
    }
  }
}
