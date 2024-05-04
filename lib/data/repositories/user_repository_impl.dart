import 'package:ecom_shop/data/api/user_api.dart';
import 'package:ecom_shop/domain/models/user_login.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi __userApi;

  UserRepositoryImpl(this.__userApi);

  @override
  Future<User> login(UserLoginModel userLoginModel) async {
    try {
      final response = await __userApi.login(userLoginModel);
      // Parse response and return user
      return User(
          id: response.data['id'],
          name: response.data['name'],
          apiToken: response.data['token']);
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }
}
