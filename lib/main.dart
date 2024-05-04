import 'package:ecom_shop/domain/usecases/get_user_usecase.dart';
import 'package:ecom_shop/ui/auth/view/user_screen.dart';
import 'package:ecom_shop/ui/auth/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiProvider(
          providers: const [],
          child: UserScreen(),
        ));
  }
}
