import 'package:flutter_countdown_timer/index.dart';
import 'package:wbid/constents/constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:flutter/material.dart';

class TimerDateWidget extends StatefulWidget {
  const TimerDateWidget({Key? key, this.date, this.underText})
      : super(key: key);

  final String? date;
  final String? underText;

  @override
  State<TimerDateWidget> createState() => _TimerDateWidgetState();
}

class _TimerDateWidgetState extends State<TimerDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialWidget(
          horizontalMargen: 12,
          materialChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              widget.date!,
              style: f18BlackTextStyle,
            ),
          ),
        ),
        Text(
          widget.underText!,
          style: f12GreyTextStyle,
        ),
      ],
    );
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key, this.endDateTime}) : super(key: key);

  final DateTime? endDateTime;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late String _days, _hours, _minuts, _seconds;

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    int myEndTime = widget.endDateTime!.millisecondsSinceEpoch;


    return CountdownTimer(
      endTime: myEndTime,
      widgetBuilder: (_, time) {
        if (time != null) {
          _days = (time.days != null)
              ? _twoDigits(time.days!.toInt().remainder(24))
              : '00';
          _hours = (time.hours != null)
              ? _twoDigits(time.hours!.toInt().remainder(60))
              : '00';
          _minuts = (time.min != null)
              ? _twoDigits(time.min!.toInt().remainder(60))
              : '00';
          _seconds = _twoDigits(time.sec!.toInt().remainder(60));

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.timer_rounded,
                size: 55,
              ),
              TimerDateWidget(
                date: _days,
                underText: 'day',
              ),
              TimerDateWidget(
                date: _hours,
                underText: 'hour',
              ),
              TimerDateWidget(
                date: _minuts,
                underText: 'minute',
              ),
              TimerDateWidget(
                date: _seconds,
                underText: 'second',
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.timer_rounded,
                size: 55,
              ),
              TimerDateWidget(
                date: '00',
                underText: 'day',
              ),
              TimerDateWidget(
                date: '00',
                underText: 'hour',
              ),
              TimerDateWidget(
                date: '00',
                underText: 'minute',
              ),
              TimerDateWidget(
                date: '00',
                underText: 'second',
              ),
            ],
          );
        }
      },
    );
  }
}
