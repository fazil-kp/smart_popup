import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// A widget that displays a video in a popup.
///
/// The [PopupVideo] class allows you to play a video file within your
/// Flutter application. It initializes a [VideoPlayerController] with
/// the specified video file and provides controls for playback settings.
///
/// ## Features:
/// - Automatically plays the video when initialized.
/// - Supports looping and playback speed adjustment.
/// - Displays a loading indicator while the video is being initialized.
///
/// ## Parameters:
/// - `videoPath`: The file path of the video to be played.
///
/// ## Usage:
/// To use the [PopupVideo], provide the file path of the video you want
/// to display. The widget will handle video playback and initialization
/// automatically.
class PopupVideo extends StatefulWidget {
  final String videoPath;

  const PopupVideo({super.key, required this.videoPath});

  @override
  State<PopupVideo> createState() => _PopupVideoState();
}

class _PopupVideoState extends State<PopupVideo> {
  VideoPlayerController? _controller;
  bool _isControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  /// Initializes the video player controller.
  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.file(File(widget.videoPath))
        ..initialize().then((_) {
          _controller?.setVolume(0.0); // Mute the video
          _controller?.play(); // Start playing the video
          _controller?.setPlaybackSpeed(2.5); // Set playback speed
          _controller?.setLooping(true); // Loop the video
          setState(() {
            _isControllerInitialized = true; // Update state
          });
        });
    } catch (e) {
      // Handle any errors during video initialization
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: _isControllerInitialized && _controller != null
          ? Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                color: Colors.white,
              ),
              child: VideoPlayer(_controller!), // Display the video player
            )
          : const Center(child: CircularProgressIndicator()), // Show loading indicator
    );
  }

  @override
  void dispose() {
    _controller?.dispose(); // Dispose the controller
    super.dispose();
  }
}
