import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musiumapplication/core/common_widget/common_snakbar.dart';
import 'package:musiumapplication/core/common_widget/common_submit_button.dart';
import 'package:musiumapplication/core/common_widget/common_text.dart';
import 'package:musiumapplication/core/common_widget/common_text_form_field.dart';
import 'package:musiumapplication/core/common_widget/common_validation.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/key/app_images_key.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';
import 'package:musiumapplication/storage/key/storage_key.dart';
import 'package:musiumapplication/storage/storage_object/storage_object.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  String extractUsername(String email) {
    RegExp regExp = RegExp(r"^([a-zA-Z]+)");
    Match? match = regExp.firstMatch(email);
    return match != null ? match.group(1)! : "";
  }

  final box = GetStorage();
  final _formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CommonTextFormField(
            validator: (p0) => ValidationHelper.validateEmail(p0),
            controller: emailController,
            prefixIcon: Icon(
              AppIcons.email,
              color: Theme.of(context).colorScheme.outline,
            ),
            hintText: AppString.email,
          ),
          20.height,
          CommonTextFormField(
            validator: (p0) => ValidationHelper.validatePassword(p0),
            controller: passwordController,
            prefixIcon: Icon(
              AppIcons.lock,
              color: Theme.of(context).colorScheme.outline,
            ),
            hintText: AppString.password,
            suffixIcon: const Icon(
              AppIcons.visibilityOff,
            ),
          ),
          20.height,
          Row(
            children: [
              Container(
                height: 22.h,
                width: 22.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.checkBoxShadowColor, width: 1.w),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.checkBoxShadowColor,
                        blurRadius: 2,
                        spreadRadius: 1,
                      )
                    ]),
                child: Checkbox(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: checkBoxValue,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue = value!;
                    });
                  },
                ),
              ),
              10.width,
              CommonText(
                text: AppString.rememberMe,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w700,
              )
            ],
          ).paddingSymmetric(horizontal: 30.w, vertical: 20.h),
          CommonSubmitButton(
            buttonText: AppString.login,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (checkBoxValue == true) {
                  String name = extractUsername(emailController.text);
                  StorageObject.write(StorageKey.login, true);
                  StorageObject.write(StorageKey.name, name);
                  StorageObject.write(StorageKey.images, AppImagesKey.defaultImages);
                  Get.offAllNamed(AppRoutesName.bottomNavigationBarScreen);
                } else {
                  CommonSnakbar.showSnackbar(context, message: AppString.pleaseCheckRememberMe);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
