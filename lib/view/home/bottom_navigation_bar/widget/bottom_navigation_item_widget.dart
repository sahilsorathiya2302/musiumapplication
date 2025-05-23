import 'package:flutter/material.dart';
import 'package:musiumapplication/core/constant/app_icons.dart';
import 'package:musiumapplication/core/constant/app_string.dart';
import 'package:musiumapplication/core/theme/app_colors.dart';
import 'package:musiumapplication/view/home/bottom_navigation_bar/widget/icon_button_widget.dart';

class BottomNavigationItemWidget extends StatefulWidget {
  final Function(int)? onIndexChanged;

  const BottomNavigationItemWidget({super.key, this.onIndexChanged});

  @override
  State<BottomNavigationItemWidget> createState() => _BottomNavigationItemWidgetState();
}

class _BottomNavigationItemWidgetState extends State<BottomNavigationItemWidget> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (widget.onIndexChanged != null) {
      widget.onIndexChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 240,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            blurRadius: 100,
            spreadRadius: 40,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButton(AppString.home, AppIcons.home, 0),
          // _buildIconButton(AppString.explore, AppIcons.search, 1),
          _buildIconButton(AppString.library, AppIcons.library, 1),
          _buildIconButton(AppString.logout, AppIcons.logout, 2),
        ],
      ),
    );
  }

  Widget _buildIconButton(String label, IconData icon, int index) {
    return IconButtonWidget(
      onPressed: () => _onItemTapped(index),
      label: label,
      onTap: () => _onItemTapped(index),
      icon: icon,
      labelColor: selectedIndex == index
          ? AppColors.submitButtonColor
          : Theme.of(context).colorScheme.secondary,
      iconColor: selectedIndex == index
          ? AppColors.submitButtonColor
          : Theme.of(context).colorScheme.secondary,
    );
  }
}
