import 'package:custom_alert_popup/custom_alert_popup.dart';
import 'package:flutter/material.dart';

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
              builder: (context) => const CustomAlertPopup(
                title: "Hello",
                description: "This is a custom alert dialog box",
                firstButtonText: "Ok",
                secondButtonText: "Cancel",
                // Do not pass image and video simultaneously; pass one at a time.
                // imagePath: "assets/images/demo_image.png",
                videoPath: "assets/videos/demo_video.mp4",
              ),
            );
          },
          child: const Text("Custom Alert Box"),
        ),
      ),
    );
  }
}
