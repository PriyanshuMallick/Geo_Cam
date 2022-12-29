void flashbutton() {
  print("Flash Button Clicked");
}

// void flashbutton(CameraController cameraController) {
  // int flashState = 0; // 0 = OFF, 1 = ON, 2 = AUTO
  // switch (flashState) {
  //   case 1:
  //     break;
  //   default:
  // }

// how to write a funtion to turn on flash in flutter?    
// //**For Flash OFF**:

//  ElevatedButton(
//             onPressed: () {
//               _cameraController.setFlashMode(FlashMode.off);
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             child: Text(
//               "Flash Off",
//               style: TextStyle(
//                   color: Colors.white, backgroundColor: Colors.transparent),
//             ),
//           ),


//  // **For Flash ON**
//      ElevatedButton(
//             onPressed: () {
//               _cameraController.setFlashMode(FlashMode.always);
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             child: Text(
//               "Flash On",
//               style: TextStyle(
//                   color: Colors.white, backgroundColor: Colors.transparent),
//             ),
//           )
//  //**For AUTO Flash:**
//   ElevatedButton(
//             onPressed: () {
//               _cameraController.setFlashMode(FlashMode.auto);
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             child: Text(
//               "Auto Flash",
//               style: TextStyle(
//                   color: Colors.white, backgroundColor: Colors.transparent),
//             ),
//           )

// how to check if flash is on or not in flutter?
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:lamp/lamp.dart';

// enum FlashState { Flash_OFF, Flash_On, Flash_Auto }

// class CameraView extends StatefulWidget {
//   final List<CameraDescription> cameras = [];
//   CameraView() {
//     availableCameras().then((cams) {
//       cameras.addAll(cams);
//       print(cameras.length);
//       print(cams.toString());
//     });
//   }

//   @override
//   _CameraViewState createState() => _CameraViewState();
// }

// class _CameraViewState extends State<CameraView>
//     with SingleTickerProviderStateMixin {
//   CameraController _controller;
//   int _selectedCameraIndex;
//   bool _isRecording;

//   FlashState currentFlashState = FlashState.Flash_OFF;
//   String flashIcon = 'flash-off';

//   AnimationController _animationController;
//   Animation _colorTween;

//   @override
//   void initState() {
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//     _colorTween = ColorTween(begin: Colors.blueGrey, end: Colors.red)
//         .animate(_animationController);
//     // _controller = CameraController(widget.cameras[0], ResolutionPreset.high,
//     //     enableAudio: true);
//     // _isRecording = false;
//     // _controller.initialize().then((_) {
//     //   if (!mounted) {
//     //     return;
//     //   }
//     //   setState(() {});
//     // });
//     if (widget.cameras.length > 0) {
//       setState(() {
//         _selectedCameraIndex = 0;
//       });
//       _switchCamera(widget.cameras[_selectedCameraIndex]);
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _startVideoRecording(BuildContext context) async {
//     if (!_controller.value.isInitialized) {
//       await showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Camera Not Responding.'),
//               content: Center(
//                 child: Text('Something went wrong.Try Again Later.'),
//               ),
//               actions: <Widget>[
//                 FlatButton(
//                   child: Text('Okay.'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             );
//           });
//       return null;
//     }
//     if (_controller.value.isRecordingVideo) {
//       return null;
//     }
//     setState(() {
//       _isRecording = true;
//     });
//     final Directory appDirectory = await getApplicationDocumentsDirectory();
//     final String videoDirectory = '${appDirectory.path}/Videos';
//     await Directory(videoDirectory).create(recursive: true);
//     final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
//     final String filePath = '$videoDirectory/$currentTime.mp4';

//     try {
//       //Lamp.turnOn();
//       await _controller.startVideoRecording(filePath);
//       //Lamp.turnOff();
//       StorageReference firebaseStorageReference =
//           FirebaseStorage.instance.ref().child(basename(filePath));
//       StorageUploadTask videoUploadTask = firebaseStorageReference.putFile(
//         File(filePath),
//         StorageMetadata(contentType: 'video/mp4'),
//       );
//       StorageTaskSnapshot uploadSnapshot = await videoUploadTask.onComplete;
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }

//   Future<void> _stopVideoRecording() async {
//     if (!_controller.value.isRecordingVideo) {
//       return null;
//     }

//     try {
//       await _controller.stopVideoRecording();
//       setState(() {
//         _isRecording = false;
//       });
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }

//   Future<void> _switchCamera(CameraDescription cameraDescription) async {
//     if (_controller != null) {
//       await _controller.dispose();
//     }
//     _controller = CameraController(cameraDescription, ResolutionPreset.high);

//     _controller.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//       if (_controller.value.hasError) {
//         Fluttertoast.showToast(
//             msg: 'An Error Occured',
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIos: 2,
//             textColor: Colors.white,
//             backgroundColor: Colors.black38);
//       }
//     });
//     try {
//       await _controller.initialize();
//     } catch (error) {
//       print(error);
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   void _onSwitchCamera() {
//     _selectedCameraIndex = _selectedCameraIndex < widget.cameras.length - 1
//         ? _selectedCameraIndex + 1
//         : 0;
//     CameraDescription selectedCamera = widget.cameras[_selectedCameraIndex];
//     _switchCamera(selectedCamera);
//     setState(() {
//       _selectedCameraIndex = _selectedCameraIndex;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: CameraPreview(_controller),
//               ),
//               Positioned(
//                 left: MediaQuery.of(context).size.width * 0.40,
//                 bottom: MediaQuery.of(context).size.height * 0.04,
//                 child: AnimatedBuilder(
//                   animation: _colorTween,
//                   builder: (context, child) => IconButton(
//                     icon: Icon(
//                       MaterialCommunityIcons.getIconData('video'),
//                     ),
//                     color: _colorTween.value,
//                     iconSize: 80.0,
//                     onPressed: () {
//                       if (!_isRecording) {
//                         _animationController.forward();
//                         _startVideoRecording(context);
//                       } else if (_isRecording) {
//                         _animationController.reverse();
//                         _stopVideoRecording();
//                       }
//                     },
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 22.0,
//                 top: 22.0,
//                 child: IconButton(
//                   icon: Icon(
//                     MaterialCommunityIcons.getIconData('camera-switch'),
//                   ),
//                   onPressed: _onSwitchCamera,
//                   iconSize: 28.0,
//                 ),
//               ),
//               Positioned(
//                 left: 22.0,
//                 top: 22.0,
//                 child: IconButton(
//                   icon: Icon(
//                     MaterialCommunityIcons.getIconData(flashIcon),
//                   ),
//                   onPressed: () {
//                     currentFlashState =
//                         currentFlashState.index < FlashState.values.length - 1
//                             ? FlashState.values[currentFlashState.index + 1]
//                             : FlashState.values[0];
//                             if(currentFlashState == FlashState.Flash_On){
//                               setState(() {
//                                 flashIcon = 'flash';
//                               });
//                               //Lamp.turnOn(); Turning on the flash through lamp package flutter but the flash not opening 
//                             } else if(currentFlashState == FlashState.Flash_Auto){
//                               setState(() {
//                                 flashIcon = 'flash-auto';
//                               });
//                             } else {
//                               setState(() {
//                                 flashIcon = 'flash-off';
//                               });
//                               //Lamp.turnOff(); 
//                             }
//                   },
//                 ),
//               )
//             ],
//           )
//         : Container(
//             child: Center(
//               child: Text('Loading'),
//             ),
//           );
//   }
// }


// //**For Flash OFF**:

//  ElevatedButton(
//             onPressed: () {
//               _cameraController.setFlashMode(FlashMode.off);
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             child: Text(
//               "Flash Off",
//               style: TextStyle(
//                   color: Colors.white, backgroundColor: Colors.transparent),
//             ),
//           ),


//  // **For Flash ON**
//      ElevatedButton(
//             onPressed: () {
//               _cameraController.setFlashMode(FlashMode.always);
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             child: Text(
//               "Flash On",
//               style: TextStyle(
//                   color: Colors.white, backgroundColor: Colors.transparent),
//             ),
//           )
//  //**For AUTO Flash:**
//   ElevatedButton(
//             onPressed: () {
//               _cameraController.setFlashMode(FlashMode.auto);
//             },
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             child: Text(
//               "Auto Flash",
//               style: TextStyle(
//                   color: Colors.white, backgroundColor: Colors.transparent),
//             ),
//           )


// enum FlashMode {
//   /// Do not use the flash when taking a picture.
//   off,

//   /// Let the device decide whether to flash the camera when taking a picture.
//   auto,

//   /// Always use the flash when taking a picture.
//   always,

//   /// Turns on the flash light and keeps it on until switched off.
//   torch,
// }


