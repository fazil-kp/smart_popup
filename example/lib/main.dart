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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultPopup(),
            WithoutButtons(),
            HideCloseButton(),
            WithSingleButton(),
            VerticalButtonPopup(),
          ],
        ),
      ),
    );
  }
}

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
