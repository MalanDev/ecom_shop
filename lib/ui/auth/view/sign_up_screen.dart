import 'package:ecom_shop/config/assets_manager.dart';
import 'package:ecom_shop/config/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_viewmodel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Image
            Image.asset(
              ImagePngAssets.appLogo,
              height: 150,
              width: 150,
            ),

            const SizedBox(height: AppMargin.m28),
            // Email Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppMargin.m16),
            // Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppMargin.m20),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Implement login functionality
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: AppMargin.m28),
            // Signup Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Do have an account?'),
                const SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sign In',
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
    );
  }
}
