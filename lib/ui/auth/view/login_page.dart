import 'package:ecom_shop/ui/auth/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return ElevatedButton(
        child: const Text("LOGIN"),
        onPressed: () async {
          // your login funtion invoke here

          // set userinfo if sucess login.
          // this will rebuild the consumer in main.dart
          // and navigate to homescreen
          //userViewModel.setUser(youruserinfo);

          // then save the user info
          final preferences = await SharedPreferences.getInstance();
          await preferences.setString('userInfo', "userData");
        });
  }
}
