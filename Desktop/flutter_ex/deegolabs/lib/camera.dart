import 'package:deegolabs/camera_screen.dart';
import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CameraScreen(),
    );
  }
}

