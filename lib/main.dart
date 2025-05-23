import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musiumapplication/controller/theme_controller.dart';
import 'package:musiumapplication/core/routes/app_pages.dart';
import 'package:musiumapplication/core/theme/dark_theme.dart';
import 'package:musiumapplication/core/theme/light_theme.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.example.musiumapplication',
  //   androidNotificationChannelName: 'Music Playback',
  //   androidNotificationOngoing: true,
  // );

  if (Platform.isAndroid && await Permission.notification.isDenied) {
    await Permission.notification.request();
  }

  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<ThemeController>(
          init: ThemeController(),
          builder: (controller) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode:
                  controller.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              initialRoute: '/',
              getPages: AppPages.pages,
            );
          },
        );
      },
    );
  }
}
