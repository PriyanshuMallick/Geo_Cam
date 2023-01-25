import 'package:flutter/material.dart';
import 'package:geo_cam/screens/settings_screen/settings_screen.dart';

void flashButton() {
  print('Flash Button Clicked');
}

void fileButton() {
  print('File Button Clicked');
}

void folderButton() {
  print('Folder Button Clicked');
}

void menuButton(BuildContext context) {
  print('Ham Menu Button Clicked');
  // Within the `FirstRoute` widget
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SettingsScreen()),
  );
}
