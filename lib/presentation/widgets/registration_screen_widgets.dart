import 'package:flutter/material.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

Widget textFieldWidget({
  required ResponsiveScreen screen,
  double hieght = 0.05,
  required TextInputType keyboardType,
  required TextEditingController controller,
  required FormFieldValidator<String> validator,
  required String label,
  required IconData icon,
  bool secured = false,
  IconData? suffixIcon,
  required BuildContext context
}) {
  return SizedBox(
    height: screen.height * hieght,
    child: TextFormField(
      obscureText: secured,
      cursorColor: mainDeepBlue,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      style: const TextStyle(color: Colors.black38),
      decoration: InputDecoration(
        prefixIconColor: mainDeepBlue,
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: mainDeepBlue,
        ),),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mainDeepBlue,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 18,
          fontFamily: "Nunito Sans",
          color: mainDeepBlue,
        ),
        // hoverColor: mainDeepBlue,
        prefixIcon: Icon(
          icon,
          color: mainDeepBlue,
          size: 35,
        ),
        suffixIcon: Icon(suffixIcon),
      ),
    ),
  );
}



