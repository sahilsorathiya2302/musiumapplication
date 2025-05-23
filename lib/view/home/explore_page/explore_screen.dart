import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';
import 'package:musiumapplication/view/home/explore_page/widget/header_widget.dart';

import 'package:musiumapplication/view/home/explore_page/widget/search_bar_widget.dart';
import 'package:musiumapplication/view/home/explore_page/widget/your_top_genres_widget.dart';

import '../../../core/common_widget/heading_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SearchBarWidget(),
            10.height,
            const HeadingWidget(
              text: AppString.yourTopGenres,
            ).paddingSymmetric(horizontal: 20.w),
            10.height,
            YourTopGenresWidget(
              name: AppList.yourTopGenres,
            ),
            10.height,
            const HeadingWidget(
              text: AppString.browseAll,
            ).paddingSymmetric(horizontal: 20.w),
            10.height,
            YourTopGenresWidget(
              name: AppList.browseAll,
            ),
          ],
        ),
      ],
    ));
  }
}
