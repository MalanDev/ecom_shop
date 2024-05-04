import 'package:ecom_shop/ui/auth/view/sign_in_screen.dart';
import 'package:ecom_shop/ui/auth/viewmodels/user_viewmodel.dart';
import 'package:ecom_shop/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
  }

  loadData(UserViewModel viewModel) {
    Future.delayed(const Duration(seconds: 2), () async {
      await viewModel.loadSharedPref();
      if (viewModel.displayedOnboard) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    loadData(userViewModel);

    return const Center(child: CircularProgressIndicator());
  }
}
