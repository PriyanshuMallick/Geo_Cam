import 'package:flutter/material.dart';
import 'package:geo_cam/utils/app_layout.dart';

import '../Theme/app_icons.dart';
import '../funtionality_list/bottom_sheet_menu_list.dart';
import 'camera_bottom_sheet.dart';
import 'camera_menu_widget.dart';
import 'camera_settings.dart';

void flashButton() {
  print("Flash Button Clicked");
}

void fileButton() {
  print("File Button Clicked");
}

void folderButton() {
  print("Folder Button Clicked");
}

void menuButton() {
  print("Ham Menu Button Clicked");
}

Future<void> bottomSheet(BuildContext context, DragUpdateDetails details) async {
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
          return const CameraBottomSheet();
        });
  }

  // Swiping in bottom direction.
  if (details.delta.dy > 0) {
    print('Going down');
    // Navigator.pop(context);
  }
  return;
}
