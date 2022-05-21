import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/logic/cubits/reading_cubit.dart';
import 'package:reading_app/presentation/layout/home_screen.dart';
import 'package:reading_app/presentation/router/app_route.dart';
import 'package:reading_app/presentation/screens/book_screen.dart';
import 'package:reading_app/presentation/screens/category_screen.dart';
import 'package:reading_app/presentation/screens/liked_books_screen.dart';
import 'package:reading_app/presentation/screens/profile_screen.dart';
import 'package:reading_app/presentation/screens/registeration_screen.dart';
import 'package:reading_app/presentation/screens/saved_books_screen.dart';
import 'package:reading_app/presentation/screens/sign_in_screen.dart';
import 'package:reading_app/presentation/screens/welcome_screen.dart';
import 'package:reading_app/shared/style/theme/theme.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoute}) : super(key: key);
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadingCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reading App',
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
