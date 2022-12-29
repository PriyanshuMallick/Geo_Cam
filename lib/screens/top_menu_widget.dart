import 'package:flutter/material.dart';

import '../Theme/app_colors.dart';

class TopMenuItem extends StatelessWidget {
  final Function() fun;
  final icon;
  const TopMenuItem({super.key, required this.fun, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: fun,
      // onPressed: () => flashbutton(_cameraController),
      icon: Icon(
        icon,
        color: AppColors.menuIcon(),
      ),
    );
  }
}
