import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'screens/camera_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get the list of cameras
  final cameras = await availableCameras();

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras; // List of available cameras
  const MyApp({super.key, required this.cameras});

  get getCameras => cameras;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Cam',
      debugShowCheckedModeBanner: false,
      home: CameraScreen(cameras: cameras),
    );
  }
}
