import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:reading_app/shared/constants/screen.dart';

Widget signInButtonWidget({
  required ResponsiveScreen screen,
  Iconify? icon,
  required Color color,
  required String text,
  required Color textColor,
  required VoidCallback onPressed,
  required double sizedBoxWidth,
}) {
  return SizedBox(
    height: screen.height * 0.06,
    width: screen.width * 0.7,
    child: MaterialButton(
      elevation: 10,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon!,
          SizedBox(
            width: sizedBoxWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sign in with $text",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
