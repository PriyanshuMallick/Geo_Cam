import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'top_menu_funtions.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras; // List of available cameras
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController; // Camera Controller
  //Future to wait until camera initializes
  late Future<void> _initializeControllerFuture;
  final int _initialCamera = 0;
  List<File> capturedImages = [];

  // void initializeCamere(int cameraIndex, {ResolutionPreset? resolutionPreset}) async {
  //   _cameraController = CameraController(
  //     // Get a specific camera from the list of available cameras.
  //     widget.cameras[cameraIndex],
  //     // Define the resolution to use.
  //     resolutionPreset ?? ResolutionPreset.medium,
  //     //Enable Audio?
  //     enableAudio: false,
  //   );

  //   _initializeControllerFuture = _cameraController.initialize().then((_) {
  //     if (!mounted) return;
  //     setState(() {});
  //   }).catchError((e) {
  //     if (e is CameraException) print("Camera Exception:\n" + e.code);
  //     // if (e is CameraException) {
  //     //   switch (e.code) {
  //     //     case 'CameraAccessDenied':
  //     //       // Handle access errors here.
  //     //       break;
  //     //     default:
  //     //       // Handle other errors here.
  //     //       break;
  //     //   }
  //     // }
  //   });
  // }

  // void changeCamere(int cameraIndex, {ResolutionPreset? resolutionPreset, bool? audio}) async {
  //   _cameraController = CameraController(
  //     // Get a specific camera from the list of available cameras.
  //     widget.cameras[cameraIndex],
  //     // Define the resolution to use.
  //     resolutionPreset ?? ResolutionPreset.medium,
  //     //Enable Audio?
  //     enableAudio: audio ?? false,
  //   );

  //   _initializeControllerFuture = _cameraController.initialize();
  // }

  @override
  // void initState() {
  //   super.initState();
  //   initializeCamere(_initialCamera);
  // }

  // void initState() {
  //   super.initState();
  //   _cameraController = CameraController(widget.cameras[0], ResolutionPreset.max);
  //   _cameraController.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
  //   }).catchError((Object e) {
  //     if (e is CameraException) {
  //       switch (e.code) {
  //         case 'CameraAccessDenied':
  //           // Handle access errors here.
  //           break;
  //         default:
  //           // Handle other errors here.
  //           break;
  //       }
  //     }
  //   });
  // }

  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.cameras[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    // _cameraController.dispose();
    super.dispose();
  }

  //? -------------------------- UI --------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // width: 430,
        // height: 85,
        color: const Color.fromARGB(255, 122, 73, 28),
        child: SafeArea(
          child: Column(children: [
            Row(children: [
              IconButton(
                onPressed: () => flashbutton(),
                // onPressed: () => flashbutton(_cameraController),
                icon: const Icon(Icons.flash_on),
              ),
            ]),
            // cameraPreview(),
          ]),
        ),
      ),
    );
  }

  //? ----------------------- Internal Funtions -----------------------

  // FutureBuilder<void> cameraPreview() {
  //   return FutureBuilder<void>(
  //     future: _initializeControllerFuture,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         return CameraPreview(_cameraController);
  //       }

  //       return const Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }

//   void captureImage() async {
//     await _initializeControllerFuture;
//     XFile xFile = await _cameraController.takePicture();

//     setState(() {
//       capturedImages.add(File(xFile.path));
//     });
//   }

//   void flipCamera() {
//     if (widget.cameras.length < 2) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Secondary camera not found!'),
//         duration: Duration(seconds: 2),
//       ));
//       return;
//     }

//     final lensDirection = _cameraController.description.lensDirection;

//     CameraDescription newCam = widget.cameras.firstWhere(
//       (description) => lensDirection == CameraLensDirection.back
//           ? description.lensDirection == CameraLensDirection.front
//           : description.lensDirection == CameraLensDirection.back,
//     );

//     // setState(() {
//     //   cam =
//     // });
//   }
}
