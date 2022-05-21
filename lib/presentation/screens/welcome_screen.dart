import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:reading_app/logic/cubits/reading_cubit.dart';
import 'package:reading_app/presentation/widgets/welcome_screen_widgets.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/login.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import '../../shared/style/theme/theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveScreen _screen = ResponsiveScreen(context);
    ReadingCubit _readingCubit = ReadingCubit.get(context);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: _screen.width,
            height: _screen.height,
            child: Image.asset(
              "assets/images/welcome_screen/background.jpg",
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate,
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ), // backgrund
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: AppTheme.lightTheme.textTheme.headline1,
                ),
                SizedBox(
                  height: _screen.height * 0.05,
                ),
                Text(
                  "You can get started with",
                  style: TextStyle(fontSize: 24, color: mainWhite),
                ),
                SizedBox(
                  height: _screen.height * 0.035,
                ),
                signInButtonWidget(
                  icon: const Iconify(Logos.google_icon),
                  color: mainWhite,
                  text: "Google",
                  textColor: mainDeepBlue,
                  screen: _screen,
                  onPressed: () {
                    _readingCubit.googleLogin();
                  },
                  sizedBoxWidth: _screen.width * 0.05,
                ),
                // SizedBox(
                //   height: _screen.height * 0.06,
                //   width: _screen.width * 0.7,
                //   child: MaterialButton(
                //     elevation: 10,
                //     onPressed: () {},
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         const Iconify(Logos.google_icon),
                //         SizedBox(
                //           width: _screen.width * 0.18,
                //         ),
                //         Text(
                //           "Google",
                //           style: TextStyle(color: mainDeepBlue, fontSize: 24),
                //         ),
                //       ],
                //     ),
                //     color: mainWhite,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10)),
                //   ),
                // ),
                SizedBox(
                  height: _screen.height * 0.015,
                ),
                // signInButtonWidget(
                //   icon: const Iconify(Logos.facebook),
                //   sizedBoxWidth: _screen.width * 0.03,
                //   color: facebookBlue,
                //   text: "Facebook",
                //   textColor: mainWhite,
                //   screen: _screen,
                //   onPressed: () {
                //     _readingCubit.logMethod = login_method.facebook;
                //     _readingCubit.facebookLogin();
                //   },
                // ),
                // SizedBox(
                //   height: _screen.height * 0.015,
                // ),
                signInButtonWidget(
                  icon: Iconify(
                    Ic.outline_email,
                    color: mainWhite,
                  ),
                  sizedBoxWidth: _screen.width * 0.03,
                  color: mainCyan,
                  text: "Email",
                  textColor: mainWhite,
                  screen: _screen,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/signup");
                  },
                ),
                SizedBox(
                  height: _screen.height * .03,
                ),
                Text(
                  "OR",
                  style: TextStyle(fontSize: 20, color: mainWhite,fontWeight: FontWeight.w500,decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: _screen.height * .02,
                ),
                SizedBox(
                  height: _screen.height * 0.06,
                  width: _screen.width * 0.7,
                  child: signInUpButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signin");
                      },
                      text: "Sign In",
                      color: mainWhite,
                      textColor: mainDeepBlue),
                ),
              ],
            ),
          ),
          Positioned(
            child: Text(
              "Ver: 0.0.1 2022 ©",
              style: TextStyle(color: mainWhite),
            ),
            bottom: 20,
          ),
        ],
      ),
    );
  }
}
