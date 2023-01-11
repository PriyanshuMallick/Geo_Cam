//? ------------------------------------- Option Button: Fat -------------------------------------

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import '../utils/app_layout.dart';

class OptionBtnFat extends StatefulWidget {
  // final Map menu;
  final String name;
  final IconData icon;
  final double iconSize;
  final Function onTap;
  final ValueGetter<bool> isButtonOn;
  const OptionBtnFat({
    super.key,
    required this.name,
    required this.icon,
    required this.iconSize,
    required this.onTap,
    required this.isButtonOn,
  });

  @override
  State<OptionBtnFat> createState() => _OptionBtnFatState();
}

class _OptionBtnFatState extends State<OptionBtnFat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        widget.onTap();
        // widget.isButtonOn = widget.isButtonOn ? false : true;
      }),
      //? Button
      child: Container(
        height: AppLayout.getHeight(86),
        width: AppLayout.getWidth(160),
        decoration: BoxDecoration(
          color: widget.isButtonOn() ? AppColors.opSelected() : AppColors.opNotSelected(),
          borderRadius: BorderRadius.circular(27),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //? Icon
              Icon(
                widget.icon,
                size: widget.iconSize,
                color: AppColors.menuIcon(),
              ),

              //? Text
              Text(
                widget.name.toUpperCase(),
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
