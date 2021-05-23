import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Displays the play/buffering status of the video controlled by [controller].
///
/// If [allowScrubbing] is true, this widget will detect taps and drags and
/// seek the video accordingly.
///
/// [padding] allows to specify some extra padding around the progress indicator
/// that will also detect the gestures.
class CustomVideoProgressIndicator extends StatefulWidget {
  /// Construct an instance that displays the play/buffering status of the video
  /// controlled by [controller].
  ///
  /// Defaults will be used for everything except [controller] if they're not
  /// provided. [allowScrubbing] defaults to false, and [padding] will default
  /// to `top: 5.0`.
  CustomVideoProgressIndicator(
    this.controller, {
    VideoProgressColors colors,
    this.allowScrubbing,
    this.padding = const EdgeInsets.only(top: 5.0),
    this.timestamps,
  }) : colors = colors ?? VideoProgressColors();

  /// The [VideoPlayerController] that actually associates a video with this
  /// widget.
  final VideoPlayerController controller;

  /// The default colors used throughout the indicator.
  ///
  /// See [VideoProgressColors] for default values.
  final VideoProgressColors colors;

  final List<Duration> timestamps;

  /// When true, the widget will detect touch input and try to seek the video
  /// accordingly. The widget ignores such input when false.
  ///
  /// Defaults to false.
  final bool allowScrubbing;

  /// This allows for visual padding around the progress indicator that can
  /// still detect gestures via [allowScrubbing].
  ///
  /// Defaults to `top: 5.0`.
  final EdgeInsets padding;

  @override
  _CustomVideoProgressIndicatorState createState() =>
      _CustomVideoProgressIndicatorState();
}

class _CustomVideoProgressIndicatorState
    extends State<CustomVideoProgressIndicator> {
  _CustomVideoProgressIndicatorState() {
    listener = () {
      if (!mounted) {
        return;
      }
      setState(() {});
    };
  }

  VoidCallback listener;

  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  String _formatDuration(Duration duration) {
    if(duration == null){
      return "0";
    }
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  List<int> durationDifferences = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void deactivate() {
    controller.removeListener(listener);
    super.deactivate();
  }

  void calculateDurationDiffs() {
    final timestamps = widget.timestamps;
    final firstDifference =
        timestamps.first.inSeconds - Duration.zero.inSeconds;

    durationDifferences.add(firstDifference);
    for (int i = 0; i < timestamps.length - 1; i++) {
      final difference = timestamps[i + 1].inSeconds - timestamps[i].inSeconds;
      durationDifferences.add(difference);
    }
    final lastDifference =
        controller.value.duration.inSeconds - timestamps.last.inSeconds;
    durationDifferences.add(lastDifference);
  }

  @override
  Widget build(BuildContext context) {
    Widget progressIndicator;
    if (controller.value.initialized) {
      if (durationDifferences.isEmpty) {
        calculateDurationDiffs();
      }

      final int duration = controller.value.duration.inMilliseconds;
      final int position = controller.value.position.inMilliseconds;

      int maxBuffering = 0;
      for (DurationRange range in controller.value.buffered) {
        final int end = range.end.inMilliseconds;
        if (end > maxBuffering) {
          maxBuffering = end;
        }
      }
      progressIndicator = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          LinearProgressIndicator(
            value: maxBuffering / duration,
            valueColor: AlwaysStoppedAnimation<Color>(colors.bufferedColor),
            backgroundColor: colors.backgroundColor,
          ),

          // LinearProgressIndicator(
          //   value: position / duration,
          //   valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
          //   backgroundColor: Colors.transparent,
          // ),
          SliderTheme(
            data: SliderThemeData(trackShape: CustomTrackShape()),
            child: Slider(
              inactiveColor: Colors.transparent,
              value: position / duration,
              onChanged: (val) => {},
              activeColor: Color(0xFFC2B83E),
            ),
          ),
        ],
      );
    } else {
      progressIndicator = LinearProgressIndicator(
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
        backgroundColor: colors.backgroundColor,
      );
    }
    final Widget paddedProgressIndicator = Stack(
      children: [
        Container(
          height: 6,
          // margin: EdgeInsets.symmetric(horizontal: 50),
          color: Colors.transparent,
          child: progressIndicator,
        ),
        Container(
          height: 10,
          child: Row(
            children: durationDifferences
                .map(
                  (difference) => Expanded(
                    flex: difference,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: double.infinity,
                        width: 2,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );

    final progressBar = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (controller.value.initialized) paddedProgressIndicator,
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(controller.value.position)),
              Text(_formatDuration(controller.value.duration))
            ],
          ),
          // child: Text(
          //   '${_formatDuration(controller.value.position)} / ${_formatDuration(controller.value.duration)}',
          //   style: TextStyle(color: Colors.black),
          // ),
        ),
      ],
    );

    if (widget.allowScrubbing) {
      return _VideoScrubber(
        child: progressBar,
        controller: controller,
      );
    } else {
      return progressBar;
    }
  }
}

class _VideoScrubber extends StatefulWidget {
  _VideoScrubber({
    @required this.child,
    @required this.controller,
  });

  final Widget child;
  final VideoPlayerController controller;

  @override
  _VideoScrubberState createState() => _VideoScrubberState();
}

class _VideoScrubberState extends State<_VideoScrubber> {
  bool _controllerWasPlaying = false;

  VideoPlayerController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    void seekToRelativePosition(Offset globalPosition) {
      final RenderBox box = context.findRenderObject();
      final Offset tapPos = box.globalToLocal(globalPosition);
      final double relative = tapPos.dx / box.size.width;
      final Duration position = controller.value.duration * relative;
      controller.seekTo(position);
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.child,
      onHorizontalDragStart: (DragStartDetails details) {
        if (!controller.value.initialized) {
          return;
        }
        _controllerWasPlaying = controller.value.isPlaying;
        if (_controllerWasPlaying) {
          controller.pause();
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (!controller.value.initialized) {
          return;
        }
        seekToRelativePosition(details.globalPosition);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_controllerWasPlaying) {
          controller.play();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (!controller.value.initialized) {
          return;
        }
        seekToRelativePosition(details.globalPosition);
      },
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
