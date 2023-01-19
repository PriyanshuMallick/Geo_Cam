import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geo_cam/camera_screen/camera_functions.dart';
import 'package:geo_cam/widget/top_menu_items.dart';
import 'package:geo_cam/theme/app_styles.dart';
import 'package:geo_cam/utils/app_layout.dart';

import '../settings/camera_settings.dart';
import '../widget/map_card.dart';
import '../widget/swipe_bar.dart';
import 'camera_bottom_sheet.dart';
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

      // imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize().then((_) {
      if (!mounted) return;
      // Changing the Default preview aspect ratio to 3 / 4
      // Because the default acpect ratio streaches the camera preview vertically
      _cameraController.value = _cameraController.value.copyWith(
        previewSize: const Size(4, 3),
      );

      setState(() {});
    }).catchError((e) {
      if (e is CameraException) {
        print('Camera Exception:\n${e.code}\n');
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
                padding: const EdgeInsets.only(top: 1),
                // padding: EdgeInsets.only(top: AppLayout.getHeight(52)),
                child: cameraPreview(),
              ),
            ),

            //? ------------------------------------------ Geo Location Card ------------------------------------------
            // ignore: prefer_const_constructors
            Center(
              // ignore: prefer_const_constructors
              child: MapCard(),
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
                                'Photo',
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
                                onTap: () => openGallery(),
                                child: Container(
                                  height: AppLayout.getHeight(65),
                                  width: AppLayout.getWidth(65),
                                  decoration: BoxDecoration(
                                    color: const Color(0x797D7D7D),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/test/Wallpaper_1.jpg',
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
                        onPanUpdate: (details) => CameraBottomSheet.show(context, details, setState),
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
          return Transform.scale(
            // scale: CameraSettings.cameraRatioCapsulePos < 2 ? 1 : 1 + CameraSettings.cameraRatio,
            scale: 1,
            child: ClipRect(
              // clipper: CameraSettings.cameraRatio == 1 ? _ClipCameraPreview() : null,
              clipper: _ClipCameraPreview(),
              child: Transform.scale(
                alignment: Alignment.topCenter,
                scale: CameraSettings.cameraRatioCapsulePos < 2
                    ? 1
                    : 1 + y / CameraSettings.cameraRatio * CameraSettings.cameraRatio,
                // scale: 2,
                child: CameraPreview(_cameraController),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  //? --------------------------------------------- To Take Photo ---------------------------------------------
  void captureImage() async {
    print('Camera Stutter Button Clicked');

    CameraFunctions.captureImage(
      _initializeControllerFuture,
      _cameraController,
    );
  }

  //? --------------------------------------------- To Flip Camera ---------------------------------------------
  void flipCamera() {
    print('Camera Flip Button Clicked');

    CameraFunctions.flipCamera(
      context,
      _cameraController,
      setState,
      initializeCamera,
    );
  }

  //? --------------------------------------------- To Open Gallery App ---------------------------------------------
  void openGallery() {
    print('Camera Gallery Button Clicked');
  }
}

double y = 0;

class _ClipCameraPreview extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // double x = size.width > size.height ? size.height : size.width;
    double x = size.width;
    double cropHeight = x / CameraSettings.cameraRatio;
    y = x / cropHeight;
    return Rect.fromLTWH(
      0,
      CameraSettings.cameraRatio == 1 ? cropHeight * 1 / 6 : 0, // Adds Top Padding to center the crop
      size.width,
      cropHeight,
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
