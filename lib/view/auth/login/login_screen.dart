import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_auth_image_title.dart';
import 'package:musiumapplication/core/common_widget/common_sign_up_button.dart';
import 'package:musiumapplication/core/common_widget/common_text_button.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/utils/font_size.dart';
import 'package:musiumapplication/view/auth/login/widget/auth_button_widget.dart';
import 'package:musiumapplication/view/auth/login/widget/text_form_field_widget.dart';
import '../../../core/common_widget/common_divider_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Column(
              children: [
                CommonAuthImageTitle(
                    text: AppString.loginToYourAccount, fontSize: FontSize.fifthLarge_28),
                const TextFormFieldWidget(),
                const CommonTextButton(text: AppString.forgotPassword),
                const CommonDividerTitle(text: AppString.orContinueWith),
                const AuthButtonWidget(),
                const CommonSignUpButton(),
              ],
            ),
          ],
        ));
  }
}
