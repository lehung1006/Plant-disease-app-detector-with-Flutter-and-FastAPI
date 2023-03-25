part of 'pests_and_diseases_bloc.dart';

@immutable
abstract class PestsAndDiseasesState extends Equatable {
  const PestsAndDiseasesState();

  @override
  List<Object> get props => [];
}

class PestsAndDiseasesInitial extends PestsAndDiseasesState {}

class GetPestsAndDiseasesSuccess extends PestsAndDiseasesState {
  final List<Item> pests;
  final List<Item> diseases;

  const GetPestsAndDiseasesSuccess(
      {required this.pests, required this.diseases});

  // @override
  // List<Object> get props => [pests];
}

class GetPestsOrDiseasesFailure extends PestsAndDiseasesState {
  final Exception e;

  const GetPestsOrDiseasesFailure({required this.e});

  // @override
  // List<Object> get props => [errorMessage];
}
