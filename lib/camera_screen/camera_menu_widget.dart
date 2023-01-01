import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

//? ------------------------------------- Top Menu Item -------------------------------------

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

//? --------------------------------------- Swipe Bar ---------------------------------------

class SwipeBar extends StatelessWidget {
  const SwipeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: 55,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.menuIcon(),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
