//? ------------------------------------- Top Menu Item -------------------------------------

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TopMenuItem extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const TopMenuItem({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: AppColors.menuIcon,
      ),
    );
  }
}
