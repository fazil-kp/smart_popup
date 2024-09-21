# CustomAlertPopup

CustomAlertPopup is a customizable alert dialog widget for Flutter applications. It offers various features, including support for Image and Video, custom widgets, animations, countdown timers,loading button and responsive design. This widget is highly configurable to fit a wide range of use cases in your application.

## Features

- Support Image and Video
- Custom title, description, and widgets
- Countdown timer with delay
- Support for images and videos
- Configurable buttons with custom actions
- Multiple animation types (fade, scale, slide, none)
- Responsive design for different screen sizes
- Hidable close button
- Loading state for buttons



## Installation

Add this package to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_alert_popup: ^1.0.0
```


## Usage of Code


Example Code:


```
Center(
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
)

```