import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.file(File(widget.videoPath))
        ..initialize().then((_) {
          _controller?.setVolume(0.0);
          _controller?.play();
          _controller?.setPlaybackSpeed(2.5);
          _controller?.setLooping(true);
          setState(() {
            _isControllerInitialized = true;
          });
        });
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: _isControllerInitialized && _controller != null ? Container(clipBehavior: Clip.antiAlias, decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)), color: Colors.white), child: VideoPlayer(_controller!)) : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
