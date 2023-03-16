part of 'pests_and_diseases_bloc.dart';

@immutable
abstract class PestsAndDiseasesEvent extends Equatable {
  const PestsAndDiseasesEvent();

  @override
  List<Object> get props => [];
}

class GetPestsEvent extends PestsAndDiseasesEvent {}

class GetDiseasesEvent extends PestsAndDiseasesEvent {}
