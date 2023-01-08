//? ------------------------------------- Top Menu Item -------------------------------------

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TopMenuItem extends StatelessWidget {
  final Function() fun;
  final IconData icon;
  const TopMenuItem({super.key, required this.fun, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: fun,
      icon: Icon(
        icon,
        color: AppColors.menuIcon(),
      ),
    );
  }
}
