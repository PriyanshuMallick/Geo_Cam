import 'package:flutter/material.dart';
import 'package:geo_cam/settings/camera_settings.dart';
import 'package:geo_cam/theme/app_colors.dart';

final List<Map<int, dynamic>> bottomSheetSlimMenus = [
  {
    //? ------------------------------------- Timer: -------------------------------------
    0: {
      'needSetState': false,
      'options': () => CameraSettings.timerOptions,
      'selectOption': (int optionIndex) => CameraSettings.timer = CameraSettings.timerOptions[optionIndex],
      'capsulePos': () => CameraSettings.timerCapsulePos,
      'setCapsulePos': (int pos) => {
            CameraSettings.timer = CameraSettings.timerOptions[pos],
            CameraSettings.timerCapsulePos = pos,
          },
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
    //? ------------------------------------- Camera Ratio: -------------------------------------
    0: {
      'needSetState': true,
      'options': () => CameraSettings.cameraRatioOptions,
      'selectOption': (int option) => CameraSettings.cameraRatio = CameraSettings.cameraRatioOptions[option],
      'capsulePos': () => CameraSettings.cameraRatioCapsulePos,
      'setCapsulePos': (int pos) => {
            CameraSettings.cameraRatio = CameraSettings.cameraRatioOptions[pos],
            CameraSettings.cameraRatioCapsulePos = pos,
          },
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
