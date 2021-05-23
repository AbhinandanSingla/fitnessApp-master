import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomControlsWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final List<Duration> timestamps;

  const CustomControlsWidget({
    @required this.controller,
    @required this.timestamps,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Image.asset('assets/images/loop.png'),
              onTap: () => controller.value.isLooping
                  ? controller.setLooping(false)
                  : controller.setLooping(true),
            ),
            buildInkWell('assets/images/previous.png', 50, 50, rewind15Seconds),
            buildInkWell(
                controller.value.isPlaying
                    ? 'assets/images/pause.png'
                    : 'assets/images/Polygon 2.png',
                80,
                80,
                () => controller.value.isPlaying
                    ? controller.pause()
                    : controller.play()),
            buildInkWell('assets/images/forward.png', 50, 50, forward15Seconds),
            InkWell(
              child: Image.asset('assets/images/loop.png'),
            )
            // buildButton(Icon(Icons.fast_rewind), rewindToPosition),
            // buildButton(Icon(Icons.replay_5), rewind5Seconds),

            // buildButton(
            //     Icon(controller.value.isPlaying
            //         ? Icons.pause
            //         : Icons.play_arrow_sharp),
            //     () => controller.value.isPlaying
            //         ? controller.pause()
            //         : controller.play()),
            // SizedBox(width: 12),
            // buildButton(Icon(Icons.forward_5), forward5Seconds),
            // SizedBox(width: 12),
            // buildButton(Icon(Icons.fast_forward), forwardToPosition),
          ],
        ),
      );

  InkWell buildInkWell(
      String image, double width, double height, Function ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
          child: Image.asset(image),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 0.2,
                    offset: Offset(0, 0),
                    spreadRadius: 4)
              ],
              borderRadius: BorderRadius.circular(50))),
    );
  }

  Widget buildButton(Widget child, Function onPressed) => Container(
        height: 50,
        width: 50,
        child: RaisedButton(
          child: child,
          onPressed: onPressed,
          color: Colors.black.withOpacity(0.1),
        ),
      );

  Future rewindToPosition() async {
    if (timestamps.isEmpty) return;
    Duration rewind(Duration currentPosition) => timestamps.lastWhere(
          (element) => currentPosition > element + Duration(seconds: 2),
          orElse: () => Duration.zero,
        );

    await goToPosition(rewind);
  }

  Future forwardToPosition() async {
    if (timestamps.isEmpty) return;
    Duration forward(Duration currentPosition) => timestamps.firstWhere(
          (position) => currentPosition < position,
          orElse: () => Duration(days: 1),
        );

    await goToPosition(forward);
  }

  Future forward5Seconds() async =>
      goToPosition((currentPosition) => currentPosition + Duration(seconds: 5));

  Future forward15Seconds() async => goToPosition(
      (currentPosition) => currentPosition + Duration(seconds: 15));

  Future rewind5Seconds() async =>
      goToPosition((currentPosition) => currentPosition - Duration(seconds: 5));

  Future rewind15Seconds() async => goToPosition(
      (currentPosition) => currentPosition - Duration(seconds: 15));

  Future goToPosition(
    Duration Function(Duration currentPosition) builder,
  ) async {
    final currentPosition = await controller.position;
    final newPosition = builder(currentPosition);

    await controller.seekTo(newPosition);
  }
}
