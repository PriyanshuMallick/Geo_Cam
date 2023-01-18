import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import '../Theme/app_consts.dart';
import 'camera_settings.dart';

class CameraFunctions {
  //? ------------------------------------------ 📁 Save Files 📁 ------------------------------------------

  static void savefile(String path, {String? albumName}) async {
    await GallerySaver.saveImage(
      path,
      toDcim: albumName == null ? true : false,
      albumName: albumName,
    ).whenComplete(() => print("\n Image Saved \n"));
  }

  //? ------------------------------------------ 📷 Flip Camera 📷 ------------------------------------------

  static void flipCamera(
    BuildContext context,
    CameraController cameraController,
    Function setState,
    Function initializeCamera,
  ) {
    print('Camera Flip Button Clicked');
    if (CameraSettings.cameras.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Secondary camera not found!'),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    final lensDirection = cameraController.description.lensDirection;

    CameraDescription newCam = CameraSettings.cameras.firstWhere(
      (description) => lensDirection == CameraLensDirection.back
          ? description.lensDirection == CameraLensDirection.front
          : description.lensDirection == CameraLensDirection.back,
    );

    setState(() {
      initializeCamera(
        description: newCam,
        audio: CameraSettings.isPhotoMode ? true : false,
      );
    });
  }

  //? ------------------------------------------ 📸 Capture Image 📸 ------------------------------------------

  static void captureImage(
    Future<void> initializeControllerFuture,
    CameraController cameraController,
  ) async {
    print('Camera Stutter Button Clicked');

    await initializeControllerFuture;

    XFile xFile;

    try {
      xFile = await cameraController.takePicture();
    } catch (e) {
      print("still taking images");
      return;
    }

    // Todo: Fix Image Strech on Save/Capturing Image

    File imageFile = File(xFile.path);

    int currentUnix = DateTime.now().millisecondsSinceEpoch;
    // final Directory directory = await getApplicationDocumentsDirectory(); // /data/user/0/com.example.geo_cam/app_flutter
    final Directory tmpDir = await getTemporaryDirectory(); // /data/user/0/com.example.geo_cam/cache
    String fileFormat = imageFile.path.split('.').last;

    // print('imageFile.path: ${imageFile.path}'); // /data/user/0/com.example.geo_cam/cache/CAP7743094702992046030.jpg

    String tmpImgPath = '${tmpDir.path}/${AppConsts.appName}_$currentUnix.$fileFormat';

    await imageFile.copy(tmpImgPath);

    CameraFunctions.savefile(
      imageFile.path,
      albumName: AppConsts.appName,
    );

    await imageFile.delete();
  }
}
