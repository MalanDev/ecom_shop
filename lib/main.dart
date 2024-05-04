import 'package:ecom_shop/data/api/user_api.dart';
import 'package:ecom_shop/data/repositories/user_repository_impl.dart';
import 'package:ecom_shop/domain/usecases/get_user_usecase.dart';
import 'package:ecom_shop/ui/auth/view/sign_in_screen.dart';
import 'package:ecom_shop/ui/auth/view/user_screen.dart';
import 'package:ecom_shop/ui/auth/viewmodels/user_viewmodel.dart';
import 'package:ecom_shop/ui/home/home_screen.dart';
import 'package:ecom_shop/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme/dark_theme.dart';
import 'config/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-Com Shop',
        debugShowCheckedModeBanner: false,
        darkTheme: DarkTheme().theme,
        theme: LightTheme().theme,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<UserViewModel>(
                create: (context) => UserViewModel(
                    GetUserUseCase(UserRepositoryImpl(UserApi())))),
          ],
          child: const SignInScreen(),
        ));
  }
}
