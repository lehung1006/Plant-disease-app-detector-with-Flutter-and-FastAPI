part of 'pests_and_diseases_bloc.dart';

@immutable
abstract class PestsAndDiseasesState extends Equatable {
  const PestsAndDiseasesState();

  @override
  List<Object> get props => [];
}

class PestsAndDiseasesInitial extends PestsAndDiseasesState {}

class GetPestsSuccess extends PestsAndDiseasesState {
  final List<Item> pests;

  const GetPestsSuccess({required this.pests});

  // @override
  // List<Object> get props => [pests];
}

class GetPestsFailure extends PestsAndDiseasesState {
  final String errorMessage;

  const GetPestsFailure({required this.errorMessage});

  // @override
  // List<Object> get props => [errorMessage];
}

class GetDiseasesSuccess extends PestsAndDiseasesState {
  final List<Item> diseases;

  const GetDiseasesSuccess({required this.diseases});

  // @override
  // List<Object> get props => [pests];
}

class GetDiseasesFailure extends PestsAndDiseasesState {
  final String errorMessage;

  const GetDiseasesFailure({required this.errorMessage});

  // @override
  // List<Object> get props => [errorMessage];
}
