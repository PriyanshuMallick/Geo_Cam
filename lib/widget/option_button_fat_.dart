//? ------------------------------------- Option Button: Fat -------------------------------------

import 'package:flutter/material.dart';
import 'package:geo_cam/theme/app_consts.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

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
    return GestureDetector(
      onTap: () => setState(() {
        widget.menu['onTap']();
      }),
      //? Button
      child: Container(
        height: AppConsts.opBtnFatH,
        width: AppConsts.opBtnFatW,
        decoration: BoxDecoration(
          color: widget.menu['isButtonOn']() ? AppColors.opSelected : AppColors.opNotSelected,
          borderRadius: BorderRadius.circular(27),
        ),
        child: Row(
          children: [
            //? Icon
            Container(
              width: AppConsts.opBtnFatW * .3,
              alignment: Alignment.centerRight,
              child: Icon(
                widget.menu['icon'],
                size: widget.menu['iconSize'],
                color: AppColors.menuIcon,
              ),
            ),

            //? Text
            SizedBox(
              width: AppConsts.opBtnFatW * .7,
              child: Text(
                widget.menu['name'].toUpperCase(),
                style: AppStyles.menuText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
