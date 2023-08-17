// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController controller;
//   late Future<void> cameras;

//   @override
//   void initState() {
//     startCamera();
//     super.initState();
//     controller = CameraController(
//       CameraDescription(
//         name: '0',
//         lensDirection: CameraLensDirection.back,
//         sensorOrientation: 0,
//       ),
//       ResolutionPreset.medium,
//     );
//     cameras = controller.initialize();
//   }

//   void startCamera() async {
//     final cameras = await availableCameras();
//     controller =
//         CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
//     await controller.initialize().then((value) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     if (controller.value.isInitialized) {
//       return Scaffold(
//         body: Stack(
//           children: [
//             CameraPreview(controller),
//           ],
//         ),
//       );
//     } else {
//       return const SizedBox();
//       // return const Center(
//       //   child: CircularProgressIndicator(),
//       // );
//     }
//     // return Scaffold(
//     //   body: FutureBuilder(
//     //     future: cameras,
//     //     builder: (context, snapshot) {
//     //       if (snapshot.connectionState == ConnectionState.done) {
//     //         return CameraPreview(controller);
//     //       } else {
//     //         return const Center(
//     //           child: CircularProgressIndicator(),
//     //         );
//     //       }
//     //     },
//     //   ),
//     // );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  late Future<void> cameras;

  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    startCamera();
    initSocket();
  }

  // InitSocket() function
  void initSocket() {
    // Replace with your server's IP address and port
    socket = IO.io('http://192.168.1.4:3000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.onConnect((_) {
      print('Connected to server');
    });

    socket.onDisconnect((_) {
      print('Disconnected from server');
    });
  }

  void startCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print("No cameras available");
      return;
    }
    controller =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
    await controller.initialize().catchError((e) {
      print(e);
    });
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(controller),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  bottom: 20,
                ),
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
