import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reading_app/presentation/layout/home_screen.dart';
import 'package:reading_app/presentation/screens/book_screen.dart';
import 'package:reading_app/presentation/screens/liked_books_screen.dart';
import 'package:reading_app/presentation/screens/profile_screen.dart';
import 'package:reading_app/presentation/screens/saved_books_screen.dart';
import 'package:reading_app/presentation/screens/welcome_screen.dart';
import 'package:reading_app/shared/constants/api_fetch.dart';
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
                      return const HomeScreen();
                    } else {
                      return const WelcomeScreen();
                    }
                  },
                ));
      // case "/signup":
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      // case "/signin":
      //   return MaterialPageRoute(builder: (_) => SignInScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/profile":
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case "/liked":
        return MaterialPageRoute(builder: (_) => const LikedBooksScreen());
      case "/saved":
        return MaterialPageRoute(builder: (_) => const SavedBooksScreen());
      // case "/category":
      //   return MaterialPageRoute(builder: (_) => CategoryScreen());
      case "/book":
        return MaterialPageRoute(
            builder: (_) => BookScreen(
                  imageUrl: bookScreenArgs[0],
                  authors: bookScreenArgs[1],
                  title: bookScreenArgs[2],
                  subtitle: bookScreenArgs[3],
                  rate: bookScreenArgs[4].toDouble(),
                  description: bookScreenArgs[5],
                ));
    }
  }
}
