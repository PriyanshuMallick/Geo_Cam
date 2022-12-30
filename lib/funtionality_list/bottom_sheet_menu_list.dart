import 'package:flutter/material.dart';
import 'package:geo_cam/Theme/app_icons.dart';
import 'package:geo_cam/camera_screen/camera_settings.dart';

List<Map<String, dynamic>> bottomSheetMenus = [
  {
    'name': 'Mirror',
    'setting': CameraSettings.isMirror,
    'icon': AppIcons.mirror_outline,
    'iconSize': 30.0,
  },
  {
    'name': 'Grid',
    'setting': CameraSettings.isGrid,
    'icon': AppIcons.grid,
    'iconSize': 30.0,
  },
  {
    'name': 'Sound',
    'setting': CameraSettings.isSound,
    'icon': AppIcons.sound_on,
    'iconSize': 30.0,
  },
  {
    'name': 'Watermark',
    'setting': CameraSettings.isWatermark,
    // 'icon': AppIcons.grid,
    'icon': Icons.abc_rounded,
    'iconSize': 30.0,
  },
  {
    'name': 'Save\nOriginal',
    'setting': CameraSettings.isSaveOriginal,
    // 'icon': AppIcons.mirror_outline,
    'icon': Icons.save,
    'iconSize': 30.0,
  },
  {
    'name': 'Map Tag',
    'setting': CameraSettings.isMapTag,
    'icon': AppIcons.location_filled,
    'iconSize': 30.0,
  },
];
