import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musiumapplication/controller/music_controller.dart';
import 'package:musiumapplication/core/common_widget/common_simple_app_bar.dart';
import 'package:musiumapplication/view/home/download/widget/name_icon_widget.dart';
import '../../../core/constant/app_string.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

final MusicController controller = Get.put(MusicController());

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadDownloadedSongs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonSimpleAppBar(
        text: AppString.download,
      ),
      body: const Column(
        children: [
          NameIconWidget(),
        ],
      ).paddingSymmetric(
        horizontal: 20,
      ),
    );
  }
}
