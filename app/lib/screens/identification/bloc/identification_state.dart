part of 'identification_bloc.dart';

@immutable
abstract class IdentificationState extends Equatable {
  const IdentificationState();

  @override
  List<Object> get props => [];
}

class IdentificationInitial extends IdentificationState {}

class GetClassifyResultSuccess extends IdentificationState {
  final ClassifyResult result;

  const GetClassifyResultSuccess({required this.result});
}

class GetClassifyResultFailure extends IdentificationState {
  final Exception e;

  const GetClassifyResultFailure({required this.e});
}

class GetPestDetectionResultSuccess extends IdentificationState {
  final PestDetectionResult pestDetectionResult;

  const GetPestDetectionResultSuccess({required this.pestDetectionResult});
}

class GetPestDetectionResultFailure extends IdentificationState {
  final Exception e;

  const GetPestDetectionResultFailure({required this.e});
}

class GetIdentifyHistoryListSuccess extends IdentificationState {
  final List<HistoryItem> historyList;

  const GetIdentifyHistoryListSuccess({required this.historyList});
}

class GetIdentifyHistoryListFailure extends IdentificationState {
  final Exception e;

  const GetIdentifyHistoryListFailure({required this.e});
}

class GetIdentifyHistoryDetailSuccess extends IdentificationState {
  final dynamic detail;

  const GetIdentifyHistoryDetailSuccess({required this.detail});
}

class GetIdentifyHistoryDetailFailure extends IdentificationState {
  final Exception e;

  const GetIdentifyHistoryDetailFailure({required this.e});
}
