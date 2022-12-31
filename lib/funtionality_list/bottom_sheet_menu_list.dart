import 'package:flutter/material.dart';
import 'package:geo_cam/Theme/app_icons.dart';
import 'package:geo_cam/camera_screen/camera_settings.dart';
import 'package:geo_cam/theme/app_colors.dart';

List<Map<String, dynamic>> bottomSheetFatMenus = [
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

List<Map<int, dynamic>> bottomSheetSlimMenus = [
  {
    //? ------------------------------------- Timer: -------------------------------------
    0: {
      'settings': CameraSettings.timerSettings,
      'setting': CameraSettings.timer,
    },
    1: {
      'text': null,
      'icon': Icons.access_time,
      'iconSize': 17.0,
      'activeColor': AppColors.oPTimer(),
    },
    2: {
      'text': '3s',
    },
    3: {
      'text': '5s',
    },
    4: {
      'text': '10s',
    },
  },
  {
    //? ------------------------------------- Ratio: -------------------------------------
    0: {
      'settings': CameraSettings.cameraRatioSettings,
      'setting': CameraSettings.cameraRatio,
    },
    1: {
      'text': '1:1',
    },
    2: {
      'text': '3:4',
    },
    3: {
      'text': '9:16',
    },
    4: {
      'text': 'FULL',
    },
  },
];
