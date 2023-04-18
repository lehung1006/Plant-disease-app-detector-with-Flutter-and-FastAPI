import 'package:app/local_storage/local_storage_services.dart';
import 'package:app/network/dio_client.dart';
import 'package:app/repository/pest_and_disease_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_services.dart';
import 'plants_repo.dart';
import 'identify_history_repo.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static PlantsRepo? _plantsRepo;
  static PestAndDiseaseRepo? _pestAndDiseaseRepo;
  static IdentifyHistoryRepo? _identifyHistoryRepo;

  static final ApiServices _apiServices =
      ApiServices(dioClient: DioClient(Dio()));

  static final LocalStorageServices _localStorageServices =
      LocalStorageServices();

  static PlantsRepo get plantsRepo =>
      _plantsRepo ??= PlantsRepoImpl(_apiServices);

  static PestAndDiseaseRepo get pestAndDiseaseRepo =>
      _pestAndDiseaseRepo ??= PestAndDiseaseRepoImpl(_apiServices);

  static IdentifyHistoryRepo get identifyHistoryRepo =>
      _identifyHistoryRepo ??= IdentifyHistoryRepoImpl(_localStorageServices);
}
