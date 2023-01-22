//? --------------------------------------- Swipe Bar ---------------------------------------

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SwipeBar extends StatelessWidget {
  const SwipeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.menuIcon(),
              width: 1.7,
            ),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
