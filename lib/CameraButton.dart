// ignore: file_names
import 'package:drone/components/CameraScreen.dart';
import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  // final IconData icon;
  // final String label;
  // final VoidCallback onPressed;

  const CameraButton({
    super.key,
    // required this.icon,
    // required this.label,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: ElevatedButton.icon(
          // Navigation
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(),
              ),
            );
          },
          //=> Fluttertoast.showToast(
          //msg: 'Camera Open',
          //fontSize: 20,
          //),
          icon: const Icon(Icons.camera_alt_rounded),
          label: const Text('Camera'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
            maximumSize: Size.fromWidth(200),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
