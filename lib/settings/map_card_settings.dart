class MapCardSettings {
  static bool isMapPreview = true;
  static String mapType = 'normal';

  static const Map<String, String> mapTypes = {
    'normal': 'Normal',
    'satellite': 'Satellite',
    'terrain': 'Terrain',
    'hybrid': 'Hybrid (Satellite + Terrain)',
  };

  //? Is Address set to Auto or Manual?
  static bool isAddressShort = true;
  static bool isAddressLong = true;
  static bool isAddressAuto = true;

  //? Longitude & Latitude
  static bool isLongLat = true;

  //? Date & Time
  static bool isDate = true;
  static bool isTime = true;
  static bool isTimeZoneAuto = true;
  // static var timeZone = true;

  static String timeZone = 'IST';
  static String timeFormat = 'hh:mm a';
  static String dateFormat = 'dd/mm/yy';
}
