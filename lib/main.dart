import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'screens/camera_screen.dart';
import 'utils/handel_exceptions.dart';

void main() async {
  List<CameraDescription> cameras = [];
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Get the list of cameras
    cameras = await availableCameras();
  } catch (e) {
    handelCameraExceptions(e);
  }
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras; // List of available cameras
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Cam',
      debugShowCheckedModeBanner: false,
      home: CameraScreen(cameras: cameras),
    );
  }
}
