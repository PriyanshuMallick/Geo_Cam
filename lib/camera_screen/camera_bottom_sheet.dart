import 'package:flutter/material.dart';

import '../funtionality_list/bottom_sheet_menu_list.dart';
import '../utils/app_layout.dart';
import 'camera_menu_widget.dart';

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
}

List<Widget> addBottomBtns() {
  List<Widget> list = [const SwipeBar()];

  return list + addBottomFatMenuBtns() + addBottomSlimMenuBtns();
}

List<Widget> addBottomFatMenuBtns() {
  List<Widget> list = [];
  for (int i = 0; i < bottomSheetMenus.length; i += 2) {
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionBtnFat(menu: bottomSheetMenus[i]),
          OptionBtnFat(menu: bottomSheetMenus[i + 1]),
        ],
      ),
    );
  }
  return list;
}

List<Widget> addBottomSlimMenuBtns() {
  List<Widget> list = [
    const OpitonBtnSlim(),
    const OpitonBtnSlim(),
  ];

  return list;
}
