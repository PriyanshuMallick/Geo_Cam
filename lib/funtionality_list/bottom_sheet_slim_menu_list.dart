import 'package:flutter/material.dart';
import 'package:geo_cam/camera_screen/camera_settings.dart';
import 'package:geo_cam/theme/app_colors.dart';

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
