import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_auth_button.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/google_api_class/google_sign_in_api.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';

class AuthButtonWidget extends StatefulWidget {
  const AuthButtonWidget({super.key});

  @override
  State<AuthButtonWidget> createState() => _AuthButtonWidgetState();
}

class _AuthButtonWidgetState extends State<AuthButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonAuthButton(
          onTap: () async {
            try {
              var user = await GoogleSignInApi.login();
              if (user != null) {
                StorageObject.write(StorageKey.login, true);

                StorageObject.write(StorageKey.name, user.displayName);
                StorageObject.write(StorageKey.images, user.photoUrl);

                Get.offAllNamed(AppRoutesName.bottomNavigationBarScreen);
              } else {
                debugPrint(AppString.signInCanceledByUser);
              }
            } catch (error) {
              debugPrint("${AppString.signInError} $error");
            }
          },
          shape: BoxShape.rectangle,
          image: AppImagesKey.google,
          text: AppString.continueGoogle,
        ),
        10.height,
        const CommonAuthButton(
          shape: BoxShape.rectangle,
          image: AppImagesKey.faceBook,
          text: AppString.continueFacebook,
        ),
        10.height,
        const CommonAuthButton(
          shape: BoxShape.rectangle,
          image: AppImagesKey.apple,
          text: AppString.continueApple,
        ),
      ],
    );
  }
}
