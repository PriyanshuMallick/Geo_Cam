import 'package:flutter/material.dart';
import 'package:geo_cam/funtionality_list/settings_page_list.dart';

import '../../theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          // style: AppStyles.titleText,
        ),
        foregroundColor: AppColors.textColor1,
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: ListView(
        children: _addSettings(),
        // children: [
        //   Center(
        //     child: ElevatedButton(
        //       child: const Text(
        //         'Go Back',
        //       ),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ),
        // ],
      ),
    );
  }

  List<Widget> _addSettings() {
    List<Widget> list = [];

    for (int i = 0, len = settingsPageList.length; i < len; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                settingsPageList[i]['title'],
              ),
              const Divider(),
              for (int j = 0, jlen = settingsPageList[i]['settings'].length; i < jlen; i++)
                settingsPageList[i]['settings'][j]['widget'],
            ],
          ),
        ),
      );
    }

    // List<Widget> _addOptions;

    return list;
  }
}
