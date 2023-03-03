import 'package:mvvm_project/data/network/BaseApiService.dart';
import 'package:mvvm_project/data/network/NetworkApiService.dart';
import 'package:mvvm_project/resources/app_url.dart';

class AuthRepository {
  BaseAPIServices _apiServices = NetworkAPIService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SignUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

//////////////
