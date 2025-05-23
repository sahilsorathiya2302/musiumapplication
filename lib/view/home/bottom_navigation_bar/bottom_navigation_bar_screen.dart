import 'package:flutter/material.dart';
import 'package:musiumapplication/core/constant/app_list.dart';
import 'package:musiumapplication/view/home/bottom_navigation_bar/widget/bottom_navigation_item_widget.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  void _updateIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationItemWidget(
        onIndexChanged: _updateIndex,
      ),
      body: AppList.pages[index],
    );
  }
}
