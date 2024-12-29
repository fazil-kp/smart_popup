import 'package:example/elements/section.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Smart Popup Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true),
      home: const SmartPopupExample(),
    );
  }
}

class SmartPopupExample extends StatelessWidget {
  const SmartPopupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Smart Popup Example"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            Section(
              title: "Normal Popup Styles",
              children: [
                DefaultPopup(),
                WithoutButtons(),
                HideCloseButton(),
                WithSingleButton(),
                VerticalButtonPopup(),
              ],
            ),
            Section(
              title: "Popup Types",
              children: [
                InfoPopup(),
                WarningPopup(),
                SuccessPopup(),
                ErrorPopup(),
                LoadingPopup(),
              ],
            ),
            Section(
              title: "Lottie Popup",
              children: [
                LottiePopup(),
              ],
            ),
            Section(
              title: "Image Popup",
              children: [
                ImagePopup(),
              ],
            ),
            Section(
              title: "Timer Delay Popup",
              children: [
                TimerDelayButtonPopup(),
              ],
            ),
            Section(
              title: "Loading Button Popup",
              children: [
                LoadingButtonPopup(),
              ],
            ),
            Section(
              title: "Open Duration Popup",
              children: [OpenDurationPopup()],
            ),
          ],
        ),
      ),
    );
  }
}

// ! 1- Normal Popup Styles Below......................................

// Default Popup
class DefaultPopup extends StatelessWidget {
  const DefaultPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
            ),
          );
        },
        buttonText: const Text("Default Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Popup Without Buttons
class WithoutButtons extends StatelessWidget {
  const WithoutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              buttonAlignment: ButtonAlignment.vertical,
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
            ),
          );
        },
        buttonText: const Text("With Out Buttons", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Popup with hiding the close button in the corner
class HideCloseButton extends StatelessWidget {
  const HideCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              buttonAlignment: ButtonAlignment.vertical,
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              showCloseButton: false,
            ),
          );
        },
        buttonText: const Text("Hide Close Button", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Popup With Single Button
class WithSingleButton extends StatelessWidget {
  const WithSingleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok", // You can pass primaryButton or secondaryButton
            ),
          );
        },
        buttonText: const Text("With Single Button", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Popup buttons aligning vertically
class VerticalButtonPopup extends StatelessWidget {
  const VerticalButtonPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              buttonAlignment: ButtonAlignment.vertical,
            ),
          );
        },
        buttonText: const Text("Vertical Buttons", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

//! 2- Popup Types.......................................................

// Info Popup
class InfoPopup extends StatelessWidget {
  const InfoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              popType: PopType.info,
            ),
          );
        },
        buttonText: const Text("Info Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Warning Popup
class WarningPopup extends StatelessWidget {
  const WarningPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              popType: PopType.warning,
            ),
          );
        },
        buttonText: const Text("Warning Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Success Popup
class SuccessPopup extends StatelessWidget {
  const SuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              popType: PopType.success,
            ),
          );
        },
        buttonText: const Text("Success Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Error Popup
class ErrorPopup extends StatelessWidget {
  const ErrorPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              popType: PopType.error,
            ),
          );
        },
        buttonText: const Text("Error Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Loading Popup
class LoadingPopup extends StatelessWidget {
  const LoadingPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              popType: PopType.loading,
            ),
          );
        },
        buttonText: const Text("Loading Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Lottie Popup
class LottiePopup extends StatelessWidget {
  const LottiePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              lottiePath: "https://lottie.host/726e43d1-4aa9-46ff-bca1-651de9c8274d/O6PneKPFVx.json", // Pass your Lottie path here. Both asset and network Lottie are supported.
            ),
          );
        },
        buttonText: const Text("Lottie Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Image Popup
class ImagePopup extends StatelessWidget {
  const ImagePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              imagePath: "assets/images/demo_image.jpg", // Pass your Image path here. Both asset and network Image are supported.
            ),
          );
        },
        buttonText: const Text("Image Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Timer Delay Button Popup
class TimerDelayButtonPopup extends StatelessWidget {
  const TimerDelayButtonPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => SmartPopup(
              // buttonAlignment: ButtonAlignment.horizontal,
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              timerDelay: 10,
              primaryButtonTap: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        buttonText: const Text("Timer Delay Button Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Loading Button Popup
class LoadingButtonPopup extends StatelessWidget {
  const LoadingButtonPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              loading: true,
              primaryButtonTap: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        buttonText: const Text("Loading Button Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// Open Duration Popup
class OpenDurationPopup extends StatelessWidget {
  const OpenDurationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SmartButton(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              openDuration: Duration(seconds: 2),
            ),
          );
        },
        buttonText: const Text("Open Duration Popup", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
