part of 'identification_bloc.dart';

@immutable
abstract class IdentificationEvent extends Equatable {
  const IdentificationEvent();

  @override
  List<Object> get props => [];
}

class GetClassifyResultEvent extends IdentificationEvent {
  final String imgBase64;
  final int type;

  const GetClassifyResultEvent({required this.imgBase64, required this.type});
}

class GetPestDetectionResultEvent extends IdentificationEvent {
  final String imgBase64;

  const GetPestDetectionResultEvent({required this.imgBase64});
}
