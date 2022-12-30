import 'package:flutter/material.dart';
import 'package:geo_cam/Theme/app_styles.dart';
import 'package:geo_cam/utils/app_layout.dart';

import '../theme/app_colors.dart';

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

class OptionBtnFat extends StatefulWidget {
  bool isSelected;
  final Function() onTap;
  // final CameraSettings settings;
  final IconData icon;
  final double iconSize;
  final String text;
  OptionBtnFat({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.iconSize,
    // required this.settings,
  });

  @override
  State<OptionBtnFat> createState() => _OptionBtnFatState();
}

class _OptionBtnFatState extends State<OptionBtnFat> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () => setState(() => widget.isSelected = widget.onTap()),
        //? Button
        child: Container(
          height: AppLayout.getHeight(86),
          width: AppLayout.getWidth(160),
          decoration: BoxDecoration(
            color: widget.isSelected ? AppColors.oPSelected() : AppColors.oPNotSelected(),
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
                  widget.text,
                  style: AppStyles.menuText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
