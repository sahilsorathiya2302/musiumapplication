import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musiumapplication/view/home/home_page/widget/based_on_your_recent_listening_widget.dart';
import 'package:musiumapplication/view/home/home_page/widget/continue_listening_widget.dart';
import 'package:musiumapplication/view/home/home_page/widget/home_app_bar.dart';
import 'package:musiumapplication/view/home/home_page/widget/your_top_mixes_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContinueListeningWidget(),
            YourTopMixesWidget(),
            BasedOnYourRecentListeningWidget(),
          ],
        ).paddingOnly(
          left: 16.w,
          right: 16.w,
          top: 20.h,
        ),
      ),
    );
  }
}
