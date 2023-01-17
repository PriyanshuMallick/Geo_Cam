import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_screen/camera_screen.dart';
import 'camera_screen/camera_settings.dart';
import 'utils/handel_exceptions.dart';

// late final List<CameraDescription> cameras;
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Get the list of cameras
    CameraSettings.cameras = await availableCameras();
  } catch (e) {
    handelCameraExceptions(e);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Geo Cam',
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
    );
  }
}
