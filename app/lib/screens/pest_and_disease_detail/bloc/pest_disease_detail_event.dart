part of 'pest_disease_detail_bloc.dart';

@immutable
abstract class PestDiseaseDetailEvent {
  const PestDiseaseDetailEvent();
}

class GetPestDetailEvent extends PestDiseaseDetailEvent {
  final String id;

  const GetPestDetailEvent({required this.id});
}

class GetDiseaseDetailEvent extends PestDiseaseDetailEvent {
  final String id;

  const GetDiseaseDetailEvent({required this.id});
}
