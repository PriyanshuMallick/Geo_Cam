//? ------------------------------------- Option Button: Fat -------------------------------------

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import '../utils/app_layout.dart';

class OptionBtnFat extends StatefulWidget {
  final Map menu;
  const OptionBtnFat({
    super.key,
    required this.menu,
  });

  @override
  State<OptionBtnFat> createState() => _OptionBtnFatState();
}

class _OptionBtnFatState extends State<OptionBtnFat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        widget.menu['setting'] = widget.menu['setting'] ? false : true;
      }),
      //? Button
      child: Container(
        height: AppLayout.getHeight(86),
        width: AppLayout.getWidth(160),
        decoration: BoxDecoration(
          color: widget.menu['setting'] ? AppColors.opSelected() : AppColors.opNotSelected(),
          borderRadius: BorderRadius.circular(27),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //? Icon
              Icon(
                widget.menu['icon'],
                size: widget.menu['iconSize'],
                color: AppColors.menuIcon(),
              ),

              //? Text
              Text(
                widget.menu['name'].toUpperCase(),
                style: AppStyles.menuText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
