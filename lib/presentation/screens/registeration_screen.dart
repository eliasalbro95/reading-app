import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/logic/cubits/reading_cubit.dart';
import 'package:reading_app/presentation/widgets/registration_screen_widgets.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmingPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ReadingCubit _readingCubit = ReadingCubit.get(context);
    ResponsiveScreen _screen = ResponsiveScreen(context);
    return BlocConsumer<ReadingCubit, ReadingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: _screen.width,
                  height: _screen.height * 0.35,
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
                          "Create an account",
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
                            "Join the world of books",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: _screen.height * .025,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              textFieldWidget(
                                hieght: 0.07,
                                context: context,
                                icon: Icons.person_outline,
                                screen: _screen,
                                controller: nameController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  if (RegExp(r"^a-zA-Z0-9+_.-").hasMatch(value)) {
                                    return "Enter a valid name, min of 3 char";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                label: 'Full Name',
                              ),
                              SizedBox(
                                height: _screen.height * .025,
                              ),
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
                                    return "Please enter your password";
                                  }
                                  if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                                    return "Enter a valid password, min of 6 char";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Password',
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
                                controller: confirmingPasswordController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  if (confirmingPasswordController.text !=
                                      passwordController.text) {
                                    return "Password doesn't match.";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Confirm password',
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: SizedBox(
                              width: _screen.width * .7,
                              height: _screen.height * .06,
                              child: signInUpButton(
                                textColor: mainWhite,
                                color: mainDeepBlue,
                                text: 'Sign Up',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _readingCubit.emailSignUp(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    Navigator.of(context).pushNamed("/home");
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
