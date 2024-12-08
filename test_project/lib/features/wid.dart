// app_widgets.dart
import 'package:flutter/material.dart';

class Wid {
  static Widget buildOptionButton(Widget? leadingIcon, String title,
      [VoidCallback? onTap, String? subtitle]) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: subtitle != null
            ? Text(subtitle,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)))
            : null,
        onTap: onTap,
      ),
    );
  }
}
