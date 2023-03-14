import 'package:app/network/dio_client.dart';

import '../network/api_services.dart';
import 'plants_repo.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static PlantsRepo? _plantsRepo;

  static final ApiServices _apiServices =
      ApiServices(dioClient: DioClient(Dio()));

  static PlantsRepo get productPlantsRepo =>
      _plantsRepo ??= PlantsRepoImpl(_apiServices);
}
