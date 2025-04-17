import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool showSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onChanged;
  final Widget? customTrailing;

  const ProfileOption({
    Key? key,
    required this.icon,
    required this.text,
    this.showSwitch = false,
    this.switchValue = false,
    this.onChanged,
    this.customTrailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(text),
      trailing: showSwitch
          ? Switch(
              value: switchValue,
              onChanged: onChanged,
              activeTrackColor: Theme.of(context).primaryColor,
            )
          : customTrailing ?? Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
