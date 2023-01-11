import 'package:flutter/material.dart';

import '../funtionality_list/bottom_sheet_slim_menu_list.dart';
import '../theme/app_icons.dart';
import '../utils/app_layout.dart';
import '../widget/option_button_fat_.dart';
import '../widget/option_button_slim.dart';
import '../widget/swipe_bar.dart';
import 'camera_settings.dart';

class CameraBottomSheet extends StatelessWidget {
  const CameraBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppLayout.getHeight(470),
      width: AppLayout.getScreenWidth(),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: addBottomBtns(),
      ),
    );
  }

  List<Widget> addBottomBtns() {
    List<Widget> list = [const SwipeBar()];

    return list + addBottomFatMenuBtns() + addBottomSlimMenuBtns();
  }

  List<Widget> addBottomFatMenuBtns() {
    List<Widget> list = [];
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionBtnFat(
            name: "Mirror",
            icon: AppIcons.mirror_outline,
            iconSize: 30,
            onTap: () => CameraSettings.isMirror = CameraSettings.isMirror ? false : true,
            isButtonOn: () => CameraSettings.isMirror,
          ),
          OptionBtnFat(
            name: "Grid",
            icon: AppIcons.grid,
            iconSize: 30,
            onTap: () => CameraSettings.isGrid = CameraSettings.isGrid ? false : true,
            isButtonOn: () => CameraSettings.isGrid,
          ),
        ],
      ),
    );

    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionBtnFat(
            name: "Sound",
            icon: AppIcons.sound_on,
            iconSize: 30,
            onTap: () => CameraSettings.isSound = CameraSettings.isSound ? false : true,
            isButtonOn: () => CameraSettings.isSound,
          ),
          OptionBtnFat(
            name: "Watermark",
            icon: Icons.abc_rounded,
            iconSize: 30,
            onTap: () => CameraSettings.isWatermark = CameraSettings.isWatermark ? false : true,
            isButtonOn: () => CameraSettings.isWatermark,
          ),
        ],
      ),
    );

    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionBtnFat(
            name: "Save\nOriginal",
            icon: Icons.save,
            iconSize: 30,
            onTap: () => CameraSettings.isSaveOriginal = CameraSettings.isSaveOriginal ? false : true,
            isButtonOn: () => CameraSettings.isSaveOriginal,
          ),
          OptionBtnFat(
            name: "Map Tag",
            icon: AppIcons.location_filled,
            iconSize: 30,
            onTap: () => CameraSettings.isMapTag = CameraSettings.isMapTag ? false : true,
            isButtonOn: () => CameraSettings.isMapTag,
          ),
        ],
      ),
    );

    return list;
  }

  List<Widget> addBottomSlimMenuBtns() {
    List<Widget> list = [];
    for (int i = 0; i < bottomSheetSlimMenus.length; i++) {
      list.add(
        OpitonBtnSlim(map: bottomSheetSlimMenus[i]),
      );
    }

    return list;
  }
}
