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

class TopMenuItemAni extends StatelessWidget {
  final Function() onTap;
  final AnimatedIconData icon;
  final Animation<double> progress;
  const TopMenuItemAni({super.key, required this.onTap, required this.icon, required this.progress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: AnimatedIcon(
        icon: icon,
        progress: progress,
        color: AppColors.menuIcon,
      ),
    );
  }
}
