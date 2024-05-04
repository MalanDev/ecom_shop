import 'package:ecom_shop/domain/models/user_login.dart';
import 'package:ecom_shop/config/constatnts.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';
import '../../../domain/usecases/get_user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  final GetUserUseCase _getUserUseCase;

  UserViewModel(this._getUserUseCase);

  bool _displayedOnboard = false;
  bool get displayedOnboard => _displayedOnboard;

  UserModel? _user;
  UserModel? get user => _user;

  void logout() async {
    final preferences = await SharedPreferences.getInstance();
    _user = null;
    preferences.remove(AppConstatnts.SP_SHOW_ON_BOARD);
    preferences.remove(AppConstatnts.SP_USER_INFO);
    notifyListeners();
  }

  bool get isAuthorized {
    if (_user != null) {
      return _user!.accessToken.isNotEmpty;
    } else {
      return false;
    }
  }

  Future<void> loadSharedPref() async {
    final preferences = await SharedPreferences.getInstance();
    var onBoard = preferences.getBool(AppConstatnts.SP_SHOW_ON_BOARD);
    var userData = preferences.getString(AppConstatnts.SP_USER_INFO);
    if (userData != null) {
      _displayedOnboard = onBoard ?? false;
      _user = userModelFromJson(userData);
    }
  }

  setShowOnBaord(bool status) {
    _displayedOnboard = status;
    notifyListeners();
  }

  Future<bool> login(
      String email, String password, int rememberMe, int systemUser) async {
    try {
      var userModel = UserLoginModel(
          email: email,
          password: password,
          rememberMe: rememberMe,
          systemUser: systemUser);

      final preferences = await SharedPreferences.getInstance();

      _user = await _getUserUseCase.login(userModel);
      if (_user != null) {
        preferences.setBool(AppConstatnts.SP_SHOW_ON_BOARD, true);
        preferences.setString(
            AppConstatnts.SP_USER_INFO, userModelToJson(_user!));
      }

      notifyListeners();
      return true;
    } catch (e) {
      // Handle error
      print('Failed to fetch user: $e');
      return false;
    }
  }
}
