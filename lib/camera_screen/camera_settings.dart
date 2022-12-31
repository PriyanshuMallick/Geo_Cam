import 'package:camera/camera.dart';

class CameraSettings {
  static ResolutionPreset resolution = ResolutionPreset.medium;
  static bool isPhotoMode = true;

  //? Bottom Sheet Settings

  static bool isMirror = false;
  static bool isGrid = false;
  static bool isSound = false;
  static bool isWatermark = false;
  static bool isSaveOriginal = false;
  static bool isMapTag = false;

  //? Set Timer

  static final List<int> timerSettings = [0, 3, 5, 10];
  static int timer = 0;

  //? Set Camera Ratio

  static final List<int> cameraRatioSettings = [0, 1, 2, 3];
  static int cameraRatio = 0;
}
