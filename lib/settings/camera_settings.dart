import 'package:camera/camera.dart';

import '../theme/app_consts.dart';

class CameraSettings {
  //?------------------------------------- Cameras-------------------------------------

  static late final List<CameraDescription> cameras;
  // static ResolutionPreset resolution = ResolutionPreset.medium;
  static ResolutionPreset resolution = ResolutionPreset.max;
  static bool isPhotoMode = true;
  static bool isVideoMode = false;

  //? ----------------------------- Bottom Sheet Settings -----------------------------

  static bool isMirror = false;
  static bool isGrid = false;
  static bool isSound = false;
  static bool isSaveOriginal = false;
  static bool isMapTag = true;

  //?------------------------------------ Set Timer------------------------------------

  static int timerCapsulePos = 0;

  static final List<int> timerOptions = [0, 3, 5, 10];
  static int timer = timerOptions[timerCapsulePos];

  //?--------------------------------- Set Camera Ratio---------------------------------
  static int cameraRatioCapsulePos = 1;

  static final List<double> cameraRatioOptions = [
    1,
    3 / 4, // Default
    9 / 16,
    AppConsts.screenRatio, // Full Screen
  ];

  static double cameraRatio = cameraRatioOptions[cameraRatioCapsulePos];

  //?------------------ SafeArea for Camera Preview in the main Screen------------------
  static bool get safeAreaCamTop {
    bool isSafeAreaTop = cameraRatio == 1 || cameraRatio == 3 / 4 ? true : false;
    print('isSafeAreaTop: $isSafeAreaTop');
    return isSafeAreaTop;
  }

  static bool get safeAreaCamBottom {
    bool isSafeAreaBottom = cameraRatio == 1 || cameraRatio == 3 / 4 ? true : false;
    print('isSafeAreaBottom: $isSafeAreaBottom');
    return isSafeAreaBottom;
  }
}
