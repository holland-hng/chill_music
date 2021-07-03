import 'dart:math';

import 'package:chill_music/core/tools/application_context.dart';
import 'package:flutter/material.dart';

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 4, top: 6),
      height: 55,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SliderTheme(
              data: _sliderThemeData.copyWith(
                inactiveTrackColor: Colors.transparent,
              ),
              child: Slider(
                activeColor: Colors.white,
                inactiveColor: Application.colors.lightGrey,
                min: 0.0,
                max: widget.duration.inMilliseconds.toDouble(),
                value: min(
                    _dragValue ?? widget.position.inMilliseconds.toDouble(),
                    widget.duration.inMilliseconds.toDouble()),
                onChanged: (value) {
                  setState(() {
                    _dragValue = value;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(Duration(milliseconds: value.round()));
                  }
                },
                onChangeEnd: (value) {
                  if (widget.onChangeEnd != null) {
                    widget.onChangeEnd!(Duration(milliseconds: value.round()));
                  }
                  _dragValue = null;
                },
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 0.0,
            child: Text(
                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                        .firstMatch("${widget.position}")
                        ?.group(1) ??
                    '${widget.position}',
                style: Theme.of(context).textTheme.caption),
          ),
          Positioned(
            right: 24,
            bottom: 0.0,
            child: Text(
                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                        .firstMatch("$_remaining")
                        ?.group(1) ??
                    '$_remaining',
                style: Theme.of(context).textTheme.caption),
          ),
        ],
      ),
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => Container(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? 1.0,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
