import 'package:camera/camera.dart';

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
  static bool isWatermark = false;
  static bool isSaveOriginal = false;
  static bool isMapTag = false;

  //?------------------------------------ Set Timer------------------------------------

  static final List<int> timerSettings = [0, 3, 5, 10];
  static int timer = 0;

  //?--------------------------------- Set Camera Ratio---------------------------------

  static final List<int> cameraRatioSettings = [0, 1, 2, 3];
  static int cameraRatio = 1;

  //?------------------ SafeArea for Camera Preview in the main Screen------------------
  static bool safeAreaCamTop = true;
  static bool safeAreaCamBottom = true;
}
