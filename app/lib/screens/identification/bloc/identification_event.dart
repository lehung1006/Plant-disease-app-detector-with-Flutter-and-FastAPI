part of 'identification_bloc.dart';

@immutable
abstract class IdentificationEvent extends Equatable {
  const IdentificationEvent();

  @override
  List<Object> get props => [];
}

class GetIdentificationResultEvent extends IdentificationEvent {
  final String imgBase64;
  final int type;
  const GetIdentificationResultEvent(
      {required this.imgBase64, required this.type});

}
