# CustomAlertPopup

CustomAlertPopup is a customizable alert dialog widget for Flutter applications. It offers various features, including support for Image and Video, custom widgets, animations, countdown timers,loading button and responsive design. This widget is highly configurable to fit a wide range of use cases in your application.

## Features

- Media Support: Display images or videos within the dialog, providing rich content experiences.
- Customizable Dialog: Easily adjust the title, description, and buttons to fit your app's needs.
- Animations: Choose from various animation types (fade, scale, slide) to create engaging transitions.
- Countdown Timer: Integrate a countdown timer to add urgency to user interactions.
- Responsive Design: The widget adapts to different screen sizes, ensuring a seamless experience on both mobile and desktop platforms.
- Custom Widgets: Include additional custom widgets within the dialog for enhanced functionality.
- Loading Indicators: Show loading states on buttons to inform users of ongoing processes
- Close Button: Hidable close button



## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_alert_popup: ^latest_version
```


## Usage


To use the CustomAlertPopup, simply create an instance of the widget and configure the desired properties, such as media paths, title, description, button texts, and animations.


```
showDialog(
  context: context,
  builder: (context) => CustomAlertPopup(
    title: "Alert Title",
    description: "This is an alert message.",
    firstButtonText: "Confirm",
    secondButtonText: "Cancel",
    // Do not pass image and video simultaneously; pass one at a time.
    //imagePath: "assets/images/your_image.png",
    videoPath: "assets/videos/your_video.mp4",
    timerDelay: 10,
    animationType: AnimationType.scale,
  ),
);
```