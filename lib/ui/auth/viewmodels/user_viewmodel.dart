import 'package:ecom_shop/domain/models/user_login.dart';
import 'package:ecom_shop/helper/constatnts.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/user.dart';
import '../../../domain/usecases/get_user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  final GetUserUseCase _getUserUseCase;

  UserViewModel(this._getUserUseCase);

  bool _displayedOnboard = false;
  bool get displayedOnboard => _displayedOnboard;

  User? _user;
  User? get user => _user;

  void logout() {
    _user = null;
    notifyListeners();
  }

  bool get isAuthorized {
    if (_user != null) {
      if (_user!.apiToken != null) {
        return _user!.apiToken!.isNotEmpty;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  setShowOnBaord(bool status) {
    _displayedOnboard = status;
    notifyListeners();
  }

  Future<void> login(
      String email, String password, int rememberMe, int systemUser) async {
    try {
      var userModel = UserLoginModel(
          email: email,
          password: password,
          rememberMe: rememberMe,
          systemUser: systemUser);

      final preferences = await SharedPreferences.getInstance();

      _user = await _getUserUseCase.login(userModel);

      preferences.setBool(SP_SHOW_ON_BOARD, _user != null);

      notifyListeners();
    } catch (e) {
      // Handle error
      print('Failed to fetch user: $e');
    }
  }
}
