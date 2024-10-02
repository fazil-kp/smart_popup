import 'package:flutter/material.dart';
import 'package:smart_popup/smart_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Alert Popup Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const CustomAlertPopupExample(),
    );
  }
}

class CustomAlertPopupExample extends StatelessWidget {
  const CustomAlertPopupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SmartPopup(
                title: "Smart Popup",
                subTitle: "This is a smart popup",
                firstButtonText: "Ok",
                secondButtonText: "Cancel",
                // Do not pass image and video simultaneously; pass one at a time.
                // imagePath: "assets/images/demo_image.png",
                videoPath: "assets/videos/demo_video.mp4",
                videoVolume: 100,
                videoPlayBackSpeed: 2.5,
              ),
            );
          },
          child: const Text("Tap Here"),
        ),
      ),
    );
  }
}
