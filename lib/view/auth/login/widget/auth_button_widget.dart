import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_snakbar.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/google_api_class/google_sign_in_api.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';
import '../../../../core/common_widget/common_auth_circle_button.dart';

class AuthButtonWidget extends StatefulWidget {
  const AuthButtonWidget({super.key});

  @override
  State<AuthButtonWidget> createState() => _AuthButtonWidgetState();
}

class _AuthButtonWidgetState extends State<AuthButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CommonAuthCircleButton(
          onTap: () async {
            try {
              var user = await GoogleSignInApi.login();
              if (user != null) {
                StorageObject.write(StorageKey.login, true);
                StorageObject.write(StorageKey.name, user.displayName);
                StorageObject.write(StorageKey.images, user.photoUrl);

                Get.offAllNamed(AppRoutesName.bottomNavigationBarScreen);
              } else {
                CommonSnakbar.showSnackbar(context, message: AppString.signInCanceledByUser);
              }
            } catch (error) {
              CommonSnakbar.showSnackbar(context, message: "${AppString.signInError} $error");
            }
          },
          image: AppImagesKey.google,
        ),
        const CommonAuthCircleButton(image: AppImagesKey.faceBook),
        const CommonAuthCircleButton(image: AppImagesKey.apple),
      ],
    );
  }
}
