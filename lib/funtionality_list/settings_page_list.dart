import 'package:geo_cam/settings/app_settings.dart';

import '../widget/settings_page_navigate.dart';

List<Map<String, dynamic>> settingsPageList = [
  {
    'title': 'Modes',
    'settings': [
      {
        'settingName': 'Watermark',
        'widget': SettingsPageNavigate(
          settingName: 'Watermark',
          value: () => AppSettings.isWatermark ? 'on' : 'off',
        ),
      },
      {
        'settingName': 'Picture Quality',
        'widget': SettingsPageNavigate(
          settingName: 'Picture Quality',
          value: () => AppSettings.isWatermark ? 'on' : 'off',
        ),
      },
    ],
  }
];
