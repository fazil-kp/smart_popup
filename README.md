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

## Examples

![main](https://github.com/user-attachments/assets/f2b84a22-f615-4f03-8fd9-def7c32097ee)
![main 2](https://github.com/user-attachments/assets/ae18e459-0787-4fa2-9793-851c8230e00f)
![main 3](https://github.com/user-attachments/assets/504ea3f3-fc7e-4818-9d6d-8e188532400a)
![main 4](https://github.com/user-attachments/assets/306049fa-0155-40ee-8dc7-3e17abdf4ead)


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

