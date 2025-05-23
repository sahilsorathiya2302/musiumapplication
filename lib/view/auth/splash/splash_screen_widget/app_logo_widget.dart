import 'package:flutter/material.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
        AppImagesKey.appLogo,
      ))),
    );
  }
}
