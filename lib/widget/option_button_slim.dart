//? ------------------------------------- Option Button: Slim ------------------------------------

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_consts.dart';
import '../theme/app_styles.dart';

class OpitonBtnSlim extends StatefulWidget {
  final Map<int, dynamic> map;
  final Function? setParentState;

  const OpitonBtnSlim({super.key, required this.map, this.setParentState});
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
          Capsule(
            map: widget.map,
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
            map[0]['selectOption'](i - 1),

            // Updated Capsule Position
            map[0]['setCapsulePos'](i - 1),

            // Changes Capsule color is the Text feild is Null
            // And user has a costum color to set for capsule
            Capsule.setCapsuleColor(map[i]),

            setState(() {}),
            if (widget.setParentState != null)
              {
                widget.setParentState!(() {}),
              },
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
}

class Capsule extends StatelessWidget {
  const Capsule({
    Key? key,
    required this.map,
  }) : super(key: key);

  final Map<int, dynamic> map;

  static bool isCapsuleColorChanged = false;
  static Color optionSeletedColor = AppColors.opSelected();

  @override
  Widget build(BuildContext context) {
    int capsulePos = map[0]['capsulePos']();
    setCapsuleColor(map[capsulePos + 1]);
    return Positioned(
      left: (AppConsts.opitonBtnSlimWL / (map.length - 1)) * capsulePos,
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
    );
  }

  static void setCapsuleColor(Map<String, dynamic> map) {
    // Checks if 'text' feild is null
    bool isNull = map['text'] == null ? true : false;

    // returns is both 'text' and 'activeColor' feild null
    if (isNull && map['activeColor'] == null) return;

    // if 'text' feild is null set Capsule color to 'activeColor'
    if (isNull) {
      optionSeletedColor = map['activeColor'];
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
