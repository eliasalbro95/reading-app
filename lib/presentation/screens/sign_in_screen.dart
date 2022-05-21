import 'package:flutter/material.dart';
import 'package:reading_app/presentation/widgets/registration_screen_widgets.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenScreenState();
}

class _SignInScreenScreenState extends State<SignInScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmingPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen _screen = ResponsiveScreen(context);
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: _screen.width,
              height: _screen.height * 0.30,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/signup_screen/signup_screen.jpg",
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
            ),
            Container(
              width: _screen.width,
              height: _screen.height * .70,
              decoration: BoxDecoration(
                  color: mainWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in to your account",
                      style: TextStyle(
                        color: mainDeepBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: _screen.height * .015,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Sign in to discover the world of books",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: _screen.height * .025,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textFieldWidget(
                            hieght: 0.07,
                            context: context,
                            icon: Icons.email_outlined,
                            screen: _screen,
                            controller: emailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return "Please enter valid email.";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            label: 'Email address',
                          ),
                          SizedBox(
                            height: _screen.height * .025,
                          ),
                          textFieldWidget(
                            hieght: 0.07,
                            context: context,
                            secured: true,
                            icon: Icons.vpn_key_outlined,
                            suffixIcon: Icons.visibility_outlined,
                            screen: _screen,
                            controller: passwordController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter your name";
                              }
                              if (RegExp(r'^.{6,}$').hasMatch(value)) {
                                return "Enter a valid password, min of 6 char";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            label: 'Password',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _screen.height * .04,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SizedBox(
                          width: _screen.width * .9,
                          height: _screen.height * .06,
                          child: signInUpButton(
                            textColor: mainWhite,
                            color: mainDeepBlue,
                            text: 'Sign in',
                            onPressed: () {
                              Navigator.of(context).pushNamed("/home");
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screen.height * .04,
                    ),
                    const Center(child: Text("Forget Password?")),
                    SizedBox(
                      height: _screen.height * .08,
                    ),
                    SizedBox(
                      width: _screen.width * .9,
                      height: _screen.height * .06,
                      child: signInUpButton(
                          onPressed: () {

                          },
                          text: "Sign up",
                          color: mainWhite,
                          textColor: mainDeepBlue),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
