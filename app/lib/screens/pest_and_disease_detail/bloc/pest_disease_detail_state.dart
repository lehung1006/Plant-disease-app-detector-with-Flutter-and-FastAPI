part of 'pest_disease_detail_bloc.dart';

@immutable
abstract class PestDiseaseDetailState {
  const PestDiseaseDetailState();
}

class PestDiseaseDetailInitial extends PestDiseaseDetailState {}

class GetDiseaseDetailSuccess extends PestDiseaseDetailState {
  final PestAndDiseaseDetail result;

  const GetDiseaseDetailSuccess({required this.result});
}

class GetPestDetailSuccess extends PestDiseaseDetailState {
  final PestAndDiseaseDetail result;

  const GetPestDetailSuccess({required this.result});
}

class GetDetailDataFaild extends PestDiseaseDetailState {
  final Exception e;

  const GetDetailDataFaild({required this.e});
}
