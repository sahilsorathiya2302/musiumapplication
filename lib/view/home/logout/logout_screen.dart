import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_submit_button.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/google_api_class/google_sign_in_api.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  void _logout() async {
    await StorageObject.write(StorageKey.login, false);
    GoogleSignInApi.logout();
    await StorageObject.remove(StorageKey.name);
    await StorageObject.remove(StorageKey.download);
    await StorageObject.remove(StorageKey.images);
    await StorageObject.remove(StorageKey.favorite);
    Get.offAllNamed(AppRoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CommonSubmitButton(
            buttonText: AppString.logout,
            onTap: _logout,
          ),
        ),
      ),
    );
  }
}
