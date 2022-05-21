import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reading_app/logic/cubits/reading_cubit.dart';
import 'package:reading_app/presentation/layout/home_screen.dart';
import 'package:reading_app/presentation/screens/category_screen.dart';
import 'package:reading_app/presentation/screens/liked_books_screen.dart';
import 'package:reading_app/presentation/screens/profile_screen.dart';
import 'package:reading_app/presentation/screens/registeration_screen.dart';
import 'package:reading_app/presentation/screens/saved_books_screen.dart';
import 'package:reading_app/presentation/screens/sign_in_screen.dart';
import 'package:reading_app/presentation/screens/welcome_screen.dart';
import 'package:reading_app/shared/constants/login.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: mainDeepBlue,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else if (snapshot.hasData) {
                      return HomeScreen();
                    } else {
                      return WelcomeScreen();
                    }
                  },
                ));
      case "/signup":
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case "/signin":
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/profile":
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case "/liked":
        return MaterialPageRoute(builder: (_) => LikedBooksScreen());
      case "/saved":
        return MaterialPageRoute(builder: (_) => SavedBooksScreen());
      case "/category":
        return MaterialPageRoute(builder: (_) => CategoryScreen());
    }
  }
}
