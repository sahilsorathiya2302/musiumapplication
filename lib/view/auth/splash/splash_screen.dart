import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';
import 'splash_screen_widget/app_logo_widget.dart';
import 'splash_screen_widget/app_name_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        if (StorageObject.read(StorageKey.login) == true) {
          Get.offAllNamed(AppRoutesName.bottomNavigationBarScreen);
        } else {
          Get.offAndToNamed(AppRoutesName.welcomeScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Align vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Align horizontally
        children: [
          AppLogoWidget(),
          AppNameWidget(),
        ],
      ),
    );
  }
}
