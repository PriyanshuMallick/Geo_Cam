import 'package:flutter/material.dart';

import '../funtionality_list/bottom_sheet_fat_menu_list.dart';
import '../funtionality_list/bottom_sheet_slim_menu_list.dart';
import '../utils/app_layout.dart';
import '../widget/option_button_fat_.dart';
import '../widget/option_button_slim.dart';
import '../widget/swipe_bar.dart';
import '../widget/top_menu_items.dart';

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
  for (int i = 0; i < bottomSheetFatMenus.length; i++) {
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionBtnFat(menu: bottomSheetFatMenus[i]),
          OptionBtnFat(menu: bottomSheetFatMenus[++i]),
        ],
      ),
    );
  }
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
