import 'package:fitness_app_workout/screens/videoPlayer/fittness_video_player/video_controls_widget.dart';
import 'package:fitness_app_workout/screens/videoPlayer/fittness_video_player/video_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'custom_controls_widget.dart';

class VideoPlayerWidget extends StatefulWidget {
  final List<Duration> timestamps;
  final url;

  const VideoPlayerWidget({
    @required this.url,
    @required this.timestamps,
    Key key,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url);

    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(controller),
                VideoControlsWidget(controller: controller),
              ],
            ),
          ),
          CustomVideoProgressIndicator(
            controller,
            allowScrubbing: true,
            timestamps: widget.timestamps,
          ),
          SizedBox(height: 12),
          CustomControlsWidget(
            controller: controller,
            timestamps: widget.timestamps,
          ),
          SizedBox(height: 12),
        ],
      );
}
