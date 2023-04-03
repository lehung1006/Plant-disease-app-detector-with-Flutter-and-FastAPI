import 'package:app/local_storage/local_storage_services.dart';
import 'package:app/network/dio_client.dart';
import 'package:app/repository/pest_and_disease_repo.dart';

import '../network/api_services.dart';
import 'plants_repo.dart';
import 'identification_history_repo.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static PlantsRepo? _plantsRepo;
  static PestAndDiseaseRepo? _pestAndDiseaseRepo;
  static IdentificationHistoryRepo? _identificationHistoryRepo;

  static final ApiServices _apiServices =
      ApiServices(dioClient: DioClient(Dio()));

  static final LocalStorageServices _localStorageServices =
      LocalStorageServices();

  static PlantsRepo get plantsRepo =>
      _plantsRepo ??= PlantsRepoImpl(_apiServices);

  static PestAndDiseaseRepo get pestAndDiseaseRepo =>
      _pestAndDiseaseRepo ??= PestAndDiseaseRepoImpl(_apiServices);

  static IdentificationHistoryRepo get identificationHistoryRepo =>
      _identificationHistoryRepo ??=
          IdentificationHistoryRepoImpl(_localStorageServices);
}
