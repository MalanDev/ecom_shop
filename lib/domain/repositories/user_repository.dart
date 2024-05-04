import 'package:ecom_shop/domain/models/user_login.dart';

import '../models/user.dart';

abstract class UserRepository {
  Future<UserModel> login(UserLoginModel userLoginModel);
}
