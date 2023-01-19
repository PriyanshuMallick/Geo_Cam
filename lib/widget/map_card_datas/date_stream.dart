import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geo_cam/theme/app_styles.dart';
import 'package:intl/intl.dart';

import '../../settings/map_card_settings.dart';

class DateStream extends StatefulWidget {
  const DateStream({super.key});

  @override
  State<DateStream> createState() => _DateStreamState();
}

class _DateStreamState extends State<DateStream> {
  final Stream<String> _dateStream = Stream.periodic(
    const Duration(seconds: 1),
    (x) => DateFormat(MapCardSettings.dateFormat).format(DateTime.now()),
  );

  late StreamSubscription<String> _dateSub;

  String _date = '';

  int count = 0;
  @override
  void initState() {
    _dateSub = _dateStream.listen((String date) {
      if (_date == date) return;

      //! Test
      count++;
      print('Date has changed $count');
      print('Date: $_date == $date\n\n');

      setState(() {
        _date = date;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _dateSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _date,
      style: AppStyles.mapCardText,
    );
  }
}
