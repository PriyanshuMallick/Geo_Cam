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
  final Map<int, dynamic> map;

  const OpitonBtnSlim({super.key, required this.map});
  @override
  State<OpitonBtnSlim> createState() => _OpitonBtnSlimState();
}

class _OpitonBtnSlimState extends State<OpitonBtnSlim> {
  bool isCapsuleColorChanged = false;
  int capsulePos = 0;
  Color optionSeletedColor = AppColors.opSelected();

  @override
  Widget build(BuildContext context) {
    setCapsuleColor(widget.map, capsulePos + 1);

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
            left: (AppConsts.opitonBtnSlimWL / (widget.map.length - 1)) * capsulePos,
            top: (AppConsts.opitonBtnSlimHL - AppConsts.opitonBtnSlimHS) / 2,
            child: Center(
              child: Container(
                height: AppConsts.opitonBtnSlimHS,
                width: AppConsts.opitonBtnSlimWS,
                decoration: BoxDecoration(
                    color: optionSeletedColor,
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
              children: addElementsFromMap(widget.map),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> addElementsFromMap(Map<int, dynamic> map) {
    List<Widget> list = [];
    for (int i = 1; i < map.length; i++) {
      list.add(
        GestureDetector(
          onTap: () => {
            // Changes Camera Settings
            map[0]['setting'] = map[0]['settings'][i - 1],

            // Updated Capsule Position
            capsulePos = i - 1,

            // Changes Capsule color is the Text feild is Null
            // And user has a costum color to set for capsule
            setCapsuleColor(map, i),

            setState(() {}),
          },
          child: Container(
            height: AppConsts.opitonBtnSlimHL,
            width: AppConsts.opitonBtnSlimWL / map.length,
            color: Colors.transparent,
            child: Center(
              child: map[i]['text'] != null
                  ? Text(
                      map[i]['text'],
                      style: AppStyles.menuText,
                      textAlign: TextAlign.center,
                    )
                  : Icon(
                      map[i]['icon'],
                      size: map[i]['iconSize'],
                      color: AppColors.menuIcon(),
                    ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  setCapsuleColor(Map<int, dynamic> map, int i) {
    // Checks if 'text' feild is null
    bool isNull = map[i]['text'] == null ? true : false;

    // returns is both 'text' and 'activeColor' feild null
    if (isNull && map[i]['activeColor'] == null) return;

    // if 'text' feild is null set Capsule color to 'activeColor'
    if (isNull) {
      optionSeletedColor = map[i]['activeColor'];
      isCapsuleColorChanged = true;
      return;
    }

    // if Capsule color is changed and 'text' feild is not null
    // set Capsule color to default theme color
    if (isCapsuleColorChanged && !isNull) {
      optionSeletedColor = AppColors.opSelected();
      isCapsuleColorChanged = false;
      return;
    }
  }
}
