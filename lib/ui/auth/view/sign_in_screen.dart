import 'package:ecom_shop/config/assets_manager.dart';
import 'package:ecom_shop/config/constatnts.dart';
import 'package:ecom_shop/config/styles_manager.dart';
import 'package:ecom_shop/config/values_manager.dart';
import 'package:ecom_shop/ui/auth/view/sign_up_screen.dart';
import 'package:ecom_shop/ui/auth/viewmodels/user_viewmodel.dart';
import 'package:ecom_shop/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  ValueNotifier<int> rememberMe = ValueNotifier(0);
  ValueNotifier<int> systemAdmin = ValueNotifier(0);

  @override
  void dispose() {
    txtEmail.dispose();
    txtPassword.dispose();
    rememberMe.dispose();
    systemAdmin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    login() async {
      var status = await userViewModel.login(
          txtEmail.text, txtPassword.text, rememberMe.value, 0);
      if (status) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppMargin.m20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: AppMargin.m28),
              // Image
              Image.asset(
                ImagePngAssets.appLogo,
                height: 150,
                width: 150,
              ),

              const SizedBox(height: AppMargin.m28),
              // Email Field
              TextFormField(
                controller: txtEmail,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    hintText: "Email"),
              ),
              const SizedBox(height: AppMargin.m16),
              // Password Field
              TextFormField(
                controller: txtPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: rememberMe,
                builder: (context, rememberMeValue, child) {
                  return Row(
                    children: [
                      Text(
                        "Remember Me",
                        style: getLightStyle(),
                      ),
                      Checkbox(
                        value: rememberMeValue == 1,
                        onChanged: (value) {
                          rememberMe.value =
                              value != null ? (value ? 1 : 0) : 0;
                        },
                      ),
                    ],
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: systemAdmin,
                builder: (context, systemAdminValue, child) {
                  return Row(
                    children: [
                      Text(
                        "System Admin",
                        style: getLightStyle(),
                      ),
                      Checkbox(
                        value: systemAdminValue == 1,
                        onChanged: (value) {
                          systemAdmin.value =
                              value != null ? (value ? 1 : 0) : 0;
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppMargin.m20),
              // Login Button
              ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
              const SizedBox(height: AppMargin.m28),
              // Signup Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Don\'t have an account?'),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
