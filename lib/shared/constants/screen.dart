import 'package:flutter/cupertino.dart';

class ResponsiveScreen {
  final BuildContext context;
  late final double width;
  late final double height;

  ResponsiveScreen(this.context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
