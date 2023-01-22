import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geo_cam/theme/app_styles.dart';
import 'package:intl/intl.dart';

import '../../settings/map_card_settings.dart';

class TimeStream extends StatefulWidget {
  const TimeStream({super.key});

  @override
  State<TimeStream> createState() => _TimeStreamState();
}

class _TimeStreamState extends State<TimeStream> {
  final Stream<String> _timeStream = Stream.periodic(
    const Duration(seconds: 1),
    (x) => DateFormat(MapCardSettings.timeFormat).format(DateTime.now()),
  );

  late StreamSubscription<String> _timeSub;

  String _time = '';

  int count = 0;
  @override
  void initState() {
    _timeSub = _timeStream.listen((String date) {
      if (_time == date) return;

      //! Test
      count++;
      print('Time has changed $count');
      print('Time: $_time == $date\n\n');

      setState(() {
        _time = date;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timeSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _time,
      style: AppStyles.mapCardText2,
    );
  }
}
