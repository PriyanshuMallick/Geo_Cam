import 'package:geo_cam/settings/map_card_settings.dart';
import 'package:intl/intl.dart';

class MapCardFuns {
  static String getDate() {
    return DateFormat(MapCardSettings.dateFormat).format(DateTime.now());
  }

  static String getTime() {
    return DateFormat(MapCardSettings.timeFormat).format(DateTime.now());
  }

  static String getAddress() {
    return '';
  }
}
