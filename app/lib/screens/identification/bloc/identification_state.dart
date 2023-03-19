part of 'identification_bloc.dart';

@immutable
abstract class IdentificationState extends Equatable {
  const IdentificationState();

  @override
  List<Object> get props => [];
}

class IdentificationInitial extends IdentificationState {}

class GetIdentificationResultSuccess extends IdentificationState {
  final Item item;

  const GetIdentificationResultSuccess({required this.item});
}

class GetIdentificationResultFailure extends IdentificationState {
  final Exception e;

  const GetIdentificationResultFailure({required this.e});
}
