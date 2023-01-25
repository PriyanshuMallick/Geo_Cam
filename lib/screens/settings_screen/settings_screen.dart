import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          // style: AppStyles.titleText,
        ),
        foregroundColor: AppColors.textColor1,
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Go Back',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
