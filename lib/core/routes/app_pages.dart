import 'package:get/get.dart';
import 'package:musiumapplication/core/routes/app_routes_name.dart';
import 'package:musiumapplication/view/auth/login/login_screen.dart';
import 'package:musiumapplication/view/auth/sign_up/sign_up_screen.dart';
import 'package:musiumapplication/view/auth/splash/splash_screen.dart';
import 'package:musiumapplication/view/auth/welcome/welcome_screen.dart';
import 'package:musiumapplication/view/home/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:musiumapplication/view/home/download/download_screen.dart';
import 'package:musiumapplication/view/home/favorite_screen/favorite_screen.dart';
import 'package:musiumapplication/view/home/home_page/home_screen.dart';
import 'package:musiumapplication/view/home/music/music_screen.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutesName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutesName.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutesName.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: AppRoutesName.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutesName.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutesName.musicScreen,
      page: () => MusicScreen(
        category: Get.arguments,
      ),
    ),
    GetPage(
      name: AppRoutesName.downloadScreen,
      page: () => const DownloadScreen(),
    ),
    GetPage(
      name: AppRoutesName.favoriteScreen,
      page: () => const FavoriteScreen(),
    ),
    GetPage(
      name: AppRoutesName.bottomNavigationBarScreen,
      page: () => const BottomNavigationBarScreen(),
    ),
  ];
}
