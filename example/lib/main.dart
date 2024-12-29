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
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          // crossAxisAlignment: CrossAxisAlignment.start,
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
              children: [
                OpenDurationPopup(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const Section({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Column(children: children.map((child) => child).toList()),
        ],
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
        color: Colors.red,
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
        buttonText: const Text("Default Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("With Out Buttons", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Hide Close Button", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("With Single Button", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Vertical Buttons", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Info Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Warning Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Success Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Error Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Loading Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Lottie Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Image Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Timer Delay Button Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Loading Button Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
        buttonText: const Text("Open Duration Popup", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
