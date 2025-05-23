import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_auth_image_title.dart';
import 'package:musiumapplication/core/common_widget/common_divider_title.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/utils/font_size.dart';
import 'package:musiumapplication/view/auth/sign_up/widget/auth_button_widget.dart';
import 'package:musiumapplication/view/auth/sign_up/widget/sign_up_widget.dart';
import 'package:musiumapplication/view/auth/sign_up/widget/submit_button_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          CommonAuthImageTitle(text: AppString.getYouIn, fontSize: FontSize.size_35),
          const AuthButtonWidget(),
          const CommonDividerTitle(text: AppString.or),
          const SubmitButtonWidget(),
          const SignUpWidget(),
        ],
      ),
    );
  }
}
