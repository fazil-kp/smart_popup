# Smart Popup

Smart Popup is a customizable alert dialog widget for Flutter applications. It offers various features, including support for Image and Video, custom widgets, animations, countdown timers,loading button and responsive design. This widget is highly configurable to fit a wide range of use cases in your application.

## Features

- `Media Support:` Display images or videos within the dialog, providing rich content experiences.
- `Customizable Dialog:` Easily adjust the title, description, and buttons to fit your app's needs.
- `Animations:` Choose from various animation types (fade, scale, slide) to create engaging transitions.
- `Countdown Timer:` Integrate a countdown timer to add urgency to user interactions.
- `Loading Indicators:` Show loading states on buttons to inform users of ongoing processes
- `Close Button:` Hidable close button
- `Custom Widgets:` Include additional custom widgets within the dialog for enhanced functionality.
- `Responsive Design:` The widget adapts to different screen sizes, ensuring a seamless experience on both mobile and desktop platforms.

<!-- ## Examples -->

<!-- ![main 1](https://github.com/user-attachments/assets/29d22597-c8b4-4e06-bc3e-fe9a26bcbb2a)
![main 2](https://github.com/user-attachments/assets/f0f68d86-9f20-4baf-b799-820c4302fc0f)
![main 3](https://github.com/user-attachments/assets/9cdf89d3-e69d-4ba7-89d2-fe3ea4d08a7c)
![main 4](https://github.com/user-attachments/assets/35278189-5b87-4e0f-bb60-47a7fe79e39f) -->


## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  smart_popup: ^latest_version
```

## Usage

To use the Smart Popup, simply create an instance of the widget and configure the desired properties, such as media paths, title, description, button texts, and animations.

```
showDialog(
  context: context,
  builder: (context) => SmartPopup(
    title: "Alert Title",
    subTitle: "This is an alert message.",
    firstButtonText: "Confirm",
    secondButtonText: "Cancel",
    firstButtonTap: () {
      Navigator.of(context).pop();
    },
    secondButtonTap: () {
      Navigator.of(context).pop();
    },
    // Do not pass image and video simultaneously; pass one at a time.
    //imagePath: "assets/images/your_image.png",
    videoPath: "assets/videos/your_video.mp4",
    videoVolume: 100,
    videoPlayBackSpeed: 2.5,
    timerDelay: 10,
    animationType: AnimationType.scale,
  ),
);
```

