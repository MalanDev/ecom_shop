import 'package:dio/dio.dart';
import 'package:ecom_shop/data/network/api_helper.dart';
import 'package:ecom_shop/domain/models/user_login.dart';
import 'package:ecom_shop/helper/constatnts.dart';

class UserApi {
  Future<Response> getUser(int userId) {
    return ApiHelper.get('/user/$userId');
  }

  Future<Response> login(UserLoginModel userModel) {
    var userData = userLoginModelToJson(userModel);

    return ApiHelper.postAsJson(urlPath: LOGIN_API, data: userData);
  }
}
