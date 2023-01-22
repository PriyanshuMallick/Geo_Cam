import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geo_cam/Theme/app_icons.dart';
import 'package:geo_cam/settings/camera_settings.dart';
import 'package:geo_cam/theme/app_text.dart';

import '../settings/app_settings.dart';

List<Map<String, dynamic>> bottomSheetFatMenus = [
  {
    'name': 'Mirror',
    'onTap': () => CameraSettings.isMirror = CameraSettings.isMirror ? false : true,
    'isButtonOn': () => CameraSettings.isMirror,
    'icon': AppIcons.mirror_outline,
    'iconSize': 30.0,
  },
  {
    'name': 'Grid',
    'onTap': () => {
          CameraSettings.isGrid = CameraSettings.isGrid ? false : true,
        },
    'isButtonOn': () => CameraSettings.isGrid,
    'icon': AppIcons.grid,
    'iconSize': 30.0,
  },
  {
    'name': 'Sound',
    'onTap': () => {
          CameraSettings.isSound = CameraSettings.isSound ? false : true,
        },
    'isButtonOn': () => CameraSettings.isSound,
    'icon': AppIcons.sound_on,
    'iconSize': 30.0,
  },
  {
    'name': 'Watermark',
    'onTap': () => {
          AppSettings.isProVersion()
              ? AppSettings.isWatermark = AppSettings.isWatermark ? false : true
              : Fluttertoast.showToast(msg: AppTextBuyPro.watermark),
        },
    'isButtonOn': () => AppSettings.isWatermark,
    // 'icon': AppIcons.grid,
    'icon': Icons.abc_rounded,
    'iconSize': 30.0,
  },
  {
    'name': 'Save\nOriginal',
    'onTap': () => {
          CameraSettings.isSaveOriginal = CameraSettings.isSaveOriginal ? false : true,
        },
    'isButtonOn': () => CameraSettings.isSaveOriginal,
    // 'icon': AppIcons.save,
    'icon': Icons.save,
    'iconSize': 30.0,
  },
  {
    'name': 'Map Tag',
    'onTap': () => {
          CameraSettings.isMapTag = CameraSettings.isMapTag ? false : true,
        },
    'isButtonOn': () => CameraSettings.isMapTag,
    'icon': AppIcons.location_filled,
    'iconSize': 30.0,
  },
];
