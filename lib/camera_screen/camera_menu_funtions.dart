import 'package:flutter/material.dart';

import 'camera_bottom_sheet.dart';

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
