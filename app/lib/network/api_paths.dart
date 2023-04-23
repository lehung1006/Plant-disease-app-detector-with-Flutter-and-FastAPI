class ApiPaths {
  static const String baseUrl = 'http://10.0.2.2:8000';

  static const String getPlantList = '/plants';
  static const String getPlantDetail = '/plants/plant';
  static const String plantsClassify = '/plants/plants_classify';

  static const String getDiseaseList = '/leafdiseases';
  static const String diseasesClassify = '/leafdiseases/leafdisease_classify';

  static const String getPestList = '/pests';
  static const String pestDetectionRoute = '/pests/detection';

  static const String requestLogin = '/auth/login';
  static const String requestRegister = '/auth/register';
}
