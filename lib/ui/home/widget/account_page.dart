import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_shop/config/color_manager.dart';
import 'package:ecom_shop/ui/auth/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/assets_manager.dart';
import '../../../config/values_manager.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();

  loadData(UserViewModel userViewModel) {
    if (userViewModel.user != null) {
      txtEmail.text = userViewModel.user!.user.email;
      txtFirstName.text = userViewModel.user!.user.firstName;
    }
  }

  logout(UserViewModel userViewModel) {
    userViewModel.logout();
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtFirstName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    final userViewModel = Provider.of<UserViewModel>(context);

    loadData(userViewModel);

    return Scaffold(
      backgroundColor: AppColorManager.primary,
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const CircleBorder(),
                  child: CachedNetworkImage(
                    imageUrl: "https://i.pravatar.cc/300",
                    width: 100,
                    height: 100,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
              decoration: const BoxDecoration(
                color: AppColorManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppMargin.m16),
                  topRight: Radius.circular(AppMargin.m16),
                ),
              ),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(AppPadding.p12),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: txtEmail,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      TextField(
                        controller: txtEmail,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'First Name',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      ElevatedButton(
                        onPressed: () => logout(userViewModel),
                        child: const Text('Sign out'),
                      ),
                    ],
                  ),
                ),
              ])),
        )
      ]),
    );
  }
}
