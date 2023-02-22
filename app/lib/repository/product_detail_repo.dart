import '../models/product_detail.dart';
import '../network/api_services.dart';
import '../network/dio_exception.dart';
import 'package:dio/dio.dart';

abstract class ProductDetailRepo {
  Future<ProductDetail> getProductDetail();
}

class ProductDetailRepoImpl extends ProductDetailRepo {
  final ApiServices _apiServices;
  
  ProductDetailRepoImpl(this._apiServices);

  @override
  Future<ProductDetail> getProductDetail() async {
    try {
      final response = await _apiServices.getProductDetail();
      final productDetail = ProductDetail.fromJson(response.data);
      return productDetail;
    } on DioError catch(e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}