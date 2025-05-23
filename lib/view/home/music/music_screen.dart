import 'package:flutter/material.dart';
import 'package:musiumapplication/core/common_widget/common_simple_app_bar.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/view/home/music/widget/music_widget.dart';

class MusicScreen extends StatelessWidget {
  final String category;
  const MusicScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonSimpleAppBar(text: AppString.songs),
      body: Column(
        children: [
          MusicWidget(
            category: category,
          ),
        ],
      ),
    );
  }
}
