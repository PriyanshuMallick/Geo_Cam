import 'package:flutter/material.dart';
import 'package:geo_cam/theme/app_consts.dart';
import 'package:geo_cam/theme/app_styles.dart';
import 'package:geo_cam/utils/app_layout.dart';

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

//? ------------------------------------- Option Button: Fat -------------------------------------

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

//? ------------------------------------- Option Button: Slim ------------------------------------

class OpitonBtnSlim extends StatefulWidget {
  const OpitonBtnSlim({super.key});

  @override
  State<OpitonBtnSlim> createState() => _OpitonBtnSlimState();
}

class _OpitonBtnSlimState extends State<OpitonBtnSlim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.opitonBtnSlimHL,
      width: AppConsts.opitonBtnSlimWL,
      decoration: BoxDecoration(
        color: AppColors.opNotSelected(),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          Positioned(
            left: (AppConsts.opitonBtnSlimWL / 4) * 3,
            top: (AppConsts.opitonBtnSlimHL - AppConsts.opitonBtnSlimHS) / 2,
            child: Center(
              child: Container(
                height: AppConsts.opitonBtnSlimHS,
                width: AppConsts.opitonBtnSlimWS,
                decoration: BoxDecoration(
                    color: AppColors.opSelected(),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      strokeAlign: StrokeAlign.center,
                      color: Colors.transparent,
                      width: AppConsts.opitonBtnSlimHL - AppConsts.opitonBtnSlimHS,
                    )),
              ),
            ),
          ),
          SizedBox.expand(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Test',
                  style: AppStyles.menuText,
                ),
                Text(
                  'Test',
                  style: AppStyles.menuText,
                ),
                Text(
                  'Test',
                  style: AppStyles.menuText,
                ),
                Text(
                  'Test',
                  style: AppStyles.menuText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
