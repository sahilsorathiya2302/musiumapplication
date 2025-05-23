import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/core/common_widget/common_your_top_mixes_container.dart';
import 'package:musiumapplication/core/common_widget/heading_widget.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/utils/sized_box_extension.dart';

class YourTopMixesWidget extends StatefulWidget {
  const YourTopMixesWidget({super.key});

  @override
  State<YourTopMixesWidget> createState() => _YourTopMixesWidgetState();
}

class _YourTopMixesWidgetState extends State<YourTopMixesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.height,
        const HeadingWidget(text: AppString.yourTopMixes),
        10.height,
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var yourTopMixes = AppList.yourTopMixes[index];
              return CommonYourTopMixesContainer(
                color: yourTopMixes.color,
                label: yourTopMixes.label,
                image: yourTopMixes.image,
              ).paddingOnly(right: 30.w);
            },
            itemCount: AppList.yourTopMixes.length,
          ),
        )
      ],
    );
  }
}
