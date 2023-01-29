import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsPageNavigate extends StatelessWidget {
  final String settingName;
  final Function? value;
  final IconData? icon;

  const SettingsPageNavigate({super.key, this.value, this.icon, required this.settingName});

  @override
  Widget build(BuildContext context) {
    if (value == null && icon == null) return Container();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            settingName,
          ),
          Expanded(child: Container()),
          if (value != null)
            Text(
              value!(),
            ),
          const Gap(2),
          Icon(
            icon ?? Icons.arrow_forward_ios_rounded,
          ),
        ],
      ),
    );
  }
}
