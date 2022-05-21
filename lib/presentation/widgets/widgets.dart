import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:reading_app/shared/constants/screen.dart';

import 'package:reading_app/shared/style/color/colors.dart';


Widget signInUpButton({
  required VoidCallback onPressed,
  required String text,
  required Color color,
  required Color textColor,
}) {
  return MaterialButton(
    elevation: 10,
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: 18,),
      ),
    ),
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}


PreferredSizeWidget appBarDefault({
  required ResponsiveScreen screen,
  required BuildContext context,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: mainWhite,
    ),
    backgroundColor: mainWhite,
    title: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: RichText(
            text: TextSpan(
                text: "be a ",
                style: TextStyle(
                  fontSize: 24,
                  color: mainDeepBlue,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "PRO",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: mainDeepBlue,
                    ),)
                ]),
          ),
        ),
        Container(
          width: screen.width * 0.25,
          height: 1,
          color: mainDeepBlue,
        ),
      ],
    ),
    leading: null,
    // actions: [
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 18.0),
    //     child: InkWell(
    //       child: Iconify(
    //         Uil.search,
    //         color: mainDeepBlue,
    //       ),
    //       onTap: () =>
    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //             content: Text(
    //               "Go for search dude!",
    //               style: TextStyle(color: mainDeepBlue),
    //             ),
    //             duration: const Duration(seconds: 1),
    //             backgroundColor: mainWhite,
    //           )),
    //     ),
    //   ),
    // ],
  );
}


PreferredSizeWidget appBarProfile({
  required ResponsiveScreen screen,
  required BuildContext context,}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: mainWhite,
    elevation: 0,
    titleSpacing: screen.width * .02,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: screen.width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Iconify(
            Ic.twotone_keyboard_arrow_left,
            color: mainDeepBlue,
            size: 40,
          ),
          Text(
            "back",
            style:
            TextStyle(color: mainDeepBlue, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ),
    // actions: [
    //   Padding(
    //     padding: EdgeInsets.symmetric(horizontal: screen.width * .02),
    //     child: Iconify(Mdi.dots_horizontal, color: mainDeepBlue),
    //   ),
    // ],
  );
}

