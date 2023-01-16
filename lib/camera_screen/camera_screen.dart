import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_cam/widget/top_menu_items.dart';
import 'package:geo_cam/theme/app_styles.dart';
import 'package:geo_cam/utils/app_layout.dart';
import 'package:path_provider/path_provider.dart';

import '../camera_screen/camera_settings.dart';
import '../widget/swipe_bar.dart';
import 'camera_menu_funtions.dart';
import '../theme/app_colors.dart';
import '../theme/app_consts.dart';
import '../theme/app_icons.dart';
import '../utils/handel_exceptions.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with WidgetsBindingObserver {
  late CameraController _cameraController; // Camera Controller
  //Future to wait until camera initializes
  late Future<void> _initializeControllerFuture;
  // final int _initialCamera = 0;
  // List<File> capturedImages = [];

  void initializeCamera({
    CameraDescription? description,
    ResolutionPreset? resolutionPreset,
    bool? audio,
  }) async {
    _cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      // If camera description is not passed then the first camera is taken from the list
      description ?? CameraSettings.cameras[0],
      // Define the resolution to use.
      resolutionPreset ?? CameraSettings.resolution,
      //Enable Audio?
      enableAudio: audio ?? CameraSettings.isVideoMode,

      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((e) {
      if (e is CameraException) {
        print("Camera Exception:\n${e.code}\n");
        handelCameraExceptions(e);
      }
    });
  }

  @override
  void initState() {
    // Hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = _cameraController;

    if (!cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
      return;
    }

    if (state == AppLifecycleState.resumed) {
      initializeCamera(description: cameraController.description);
      return;
    }
  }

  //? -------------------------- UI --------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor(),
      body: SizedBox(
        height: AppLayout.getScreenHeight(),
        child: Stack(
          children: [
            //? ------------------------------------------ Camera Live Preview ------------------------------------------
            SafeArea(
              top: CameraSettings.safeAreaCamTop,
              bottom: CameraSettings.safeAreaCamBottom,
              child: Padding(
                padding: EdgeInsets.only(top: AppLayout.getHeight(52)),
                child: cameraPreview(),
              ),
            ),

            //? ----------------------------------------------- Top Menu -----------------------------------------------
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConsts.menuPadH,
                vertical: AppConsts.menuPadV,
              ),
              color: AppColors.mainMenuBG(),
              width: AppLayout.getScreenWidth(),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //? Flash Button
                    TopMenuItem(onTap: () => flashButton(), icon: Icons.flash_on_rounded),

                    //? File Button
                    TopMenuItem(onTap: () => fileButton(), icon: Icons.file_copy_outlined),

                    //? Folder Button
                    TopMenuItem(onTap: () => folderButton(), icon: Icons.folder_open_outlined),

                    //? Ham Menu Button
                    TopMenuItem(onTap: () => menuButton(), icon: Icons.menu_open_outlined)
                  ],
                ),
              ),
            ),

            //? ---------------------------------------------- Bottom Menu ----------------------------------------------
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConsts.menuPadH,
                  vertical: AppConsts.menuPadV,
                ),
                color: AppColors.mainMenuBG(),
                height: AppLayout.getHeight(244),
                width: AppLayout.getScreenWidth(),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        //? Swipe Bar
                        const SwipeBar(),

                        //? Camera Modes
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Photo",
                                style: AppStyles.menuText,
                              ),
                            ],
                          ),
                        ),

                        Expanded(child: Container()),

                        //? Action Buttons
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //? Gallery Button
                              GestureDetector(
                                onTap: () => showGallery(),
                                child: Container(
                                  height: AppLayout.getHeight(65),
                                  width: AppLayout.getWidth(65),
                                  decoration: BoxDecoration(
                                    color: const Color(0x797D7D7D),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/images/test/Wallpaper_1.jpg",
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),

                              //? Stutter Button
                              GestureDetector(
                                onTap: () => captureImage(),
                                child: Container(
                                  height: AppLayout.getHeight(85),
                                  width: AppLayout.getWidth(85),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: const Color(0x797D7D7D),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              //? Camera Flip Button
                              GestureDetector(
                                onTap: () => flipCamera(),
                                child: Container(
                                  height: AppLayout.getHeight(65),
                                  width: AppLayout.getWidth(65),
                                  decoration: BoxDecoration(
                                    color: const Color(0x15FFFFFF),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  // child: const Icon(Icons.camera),
                                  child: const Icon(
                                    AppIcons.camera_flip,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(child: Container()),
                      ],
                    ),
                    SizedBox.expand(
                      child: GestureDetector(
                        onPanUpdate: (details) => bottomSheet(context, details),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //? ------------------------------------------ Internal Funtions ------------------------------------------

  //? ---------------------------------------- To show camera preview ----------------------------------------
  FutureBuilder<void> cameraPreview() {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: CameraSettings.cameraRatio,
            child: CameraPreview(_cameraController),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void captureImage() async {
    print('Camera Stutter Button Clicked');

    await _initializeControllerFuture;
    XFile xFile = await _cameraController.takePicture();

    File imageFile = File(xFile.path);

    int currentUnix = DateTime.now().millisecondsSinceEpoch;
    final Directory directory = await getApplicationDocumentsDirectory();
    String fileFormat = imageFile.path.split('.').last;

    print('directory.path: ${directory.path}');
    print('imageFile.path: ${imageFile.path}');

    await imageFile.copy(
      // '${directory.path}/$currentUnix.$fileFormat',
      'Pictures/GeoCam/$currentUnix.$fileFormat',
    );
    // setState(() {
    // capturedImages.add(File(xFile.path));
    // });
  }

  void flipCamera() {
    print('Camera Flip Button Clicked');
    // if (widget.cameras.length < 2) {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('Secondary camera not found!'),
    //     duration: Duration(seconds: 2),
    //   ));
    //   return;
    // }

    // final lensDirection = _cameraController.description.lensDirection;

    // CameraDescription newCam = widget.cameras.firstWhere(
    //   (description) => lensDirection == CameraLensDirection.back
    //       ? description.lensDirection == CameraLensDirection.front
    //       : description.lensDirection == CameraLensDirection.back,
    // );

    // setState(() {
    //   initializeCamera(
    //     description: newCam,
    //     audio: CameraSettings.isPhotoMode ? true : false,
    //   );
    // });
  }

  void showGallery() {
    print('Camera Gallery Button Clicked');
  }
}
