import 'package:ecom_shop/domain/models/user_login.dart';

import '../models/user.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<UserModel> login(UserLoginModel userLoginModel) {
    return _userRepository.login(userLoginModel);
  }
}
