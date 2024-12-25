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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
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
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(color: Colors.white, image: DecorationImage(image: AssetImage("assets/images/bg_image.png"), fit: BoxFit.fill)),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ! 1- Normal Popup Styles ......................................
              Text("Normal Popup Styles", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              DefaultPopup(),
              WithoutButtons(),
              HideCloseButton(),
              WithSingleButton(),
              VerticalButtonPopup(),
              // ! 2- Popup Types  ......................................
              Text("Popup Types", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              InfoPopup(),
              WarningPopup(),
              SuccessPopup(),
              ErrorPopup(),
              LoadingPopup(),
              //! 3 - Lottie Popup ....................................................
              Text("Lottie Popup", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              LottiePopup(),
              //! 4 - Image Popup .................................................
              Text("Image Popup", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ImagePopup(),
              //! 5 - Timer Delay Button Popup ................................
              Text("Timer Delay Popup", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TimerDelayButtonPopup(),
              //! 6 - Loading Button Popup .............................................
              Text("Loading Button Popup", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              LoadingButtonPopup(),
              //! 7 - Open Duration Popup.............................................
              Text("Open Duration Popup", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              OpenDurationPopup(),
            ],
          ),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Default Popup"),
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
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              buttonAlignment: ButtonAlignment.vertical,
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
            ),
          );
        },
        child: const Text("With Out Buttons"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Hide Close Button"),
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
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok", // You can pass primaryButton or secondaryButton
            ),
          );
        },
        child: const Text("With Single Button"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Vertical Buttons"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Info Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Warning Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Success Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Error Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Loading Popup"),
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
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              lottiePath: "assets/lottie/loading.json", // Pass your Lottie path here. Both asset and network Lottie are supported.
            ),
          );
        },
        child: const Text("Lottie Popup"),
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
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const SmartPopup(
              title: "Smart Popup",
              subTitle: "This is a smart popup. It can display alerts and messages",
              primaryButtonText: "Ok",
              secondaryButtonText: "Cancel",
              imagePath: "assets/images/demo_image.png", // Pass your Image path here. Both asset and network Image are supported.
            ),
          );
        },
        child: const Text("Image Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Timer Delay Button Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Loading Button Popup"),
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
      child: ElevatedButton(
        onPressed: () {
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
        child: const Text("Open Duration Popup"),
      ),
    );
  }
}
