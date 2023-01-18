import 'package:flutter/material.dart';

import '../funtionality_list/bottom_sheet_fat_menu_list.dart';
import '../funtionality_list/bottom_sheet_slim_menu_list.dart';
import '../utils/app_layout.dart';
import '../widget/option_button_fat_.dart';
import '../widget/option_button_slim.dart';
import '../widget/swipe_bar.dart';

class CameraBottomSheet extends StatelessWidget {
  final Function setState;
  const CameraBottomSheet({
    Key? key,
    required this.setState,
  }) : super(key: key);

  static void show(BuildContext context, DragUpdateDetails details, Function setState) {
    print("Bottom Sheet Clicked");

    // Swiping in top direction.
    if (details.delta.dy < 0) {
      print('Going up');
      print("Showing Bottom Sheet");
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
          builder: (context) {
            return CameraBottomSheet(setState: setState);
          });
    }

    // Swiping in bottom direction.
    if (details.delta.dy > 0) {
      print('Going down');
      Navigator.pop(context);
      return;
    }
  }

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
        bottomSheetSlimMenus[i][0]['needSetState']
            ? OpitonBtnSlim(map: bottomSheetSlimMenus[i], setParentState: setState)
            : OpitonBtnSlim(map: bottomSheetSlimMenus[i]),
      );
    }

    return list;
  }
}
