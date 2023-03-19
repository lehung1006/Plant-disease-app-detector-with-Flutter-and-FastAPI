import 'package:app/models/item.dart';
import 'package:app/repository/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'identification_event.dart';
part 'identification_state.dart';

class IdentificationBloc
    extends Bloc<IdentificationEvent, IdentificationState> {
  IdentificationBloc() : super(IdentificationInitial()) {
    on<IdentificationEvent>((event, emit) async {
      if(event is GetIdentificationResultEvent) {
        try {
          print(event.imgBase64);
          print(event.type);
          final Item item = await ApiRepository.plantsRepo.getPlantClassifyResult(event.imgBase64);
          emit(GetIdentificationResultSuccess(item: item));
          
        } on Exception catch (e) {
          emit(GetIdentificationResultFailure(e: e));
        }
      }
    });
  }
}
