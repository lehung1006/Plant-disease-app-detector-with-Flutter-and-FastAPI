import 'package:app/network/dio_client.dart';

import '../network/api_services.dart';
import 'product_detail_repo.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  static ProductDetailRepo? _productDetailRepo;

  static final ApiServices _apiServices =
      ApiServices(dioClient: DioClient(Dio()));

  static ProductDetailRepo get productDetailRepo =>
      _productDetailRepo ??= ProductDetailRepoImpl(_apiServices);
}
