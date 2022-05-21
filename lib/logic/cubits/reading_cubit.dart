import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'reading_state.dart';

class ReadingCubit extends Cubit<ReadingState> {
  ReadingCubit() : super(ReadingInitial());

// ------------ Initialize Section ------------
  static ReadingCubit get(context) => BlocProvider.of(context);

// ---------------------------------
// ------------ Sign In ------------
// ---------------------------------

// ------------ Google ------------
  // ------------ In ------------
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user_Data => _user!;


  Future googleLogin() async {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(ReadingGoogleSignInState());
  }

  // ------------ Out ------------
  Future googleLogout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.disconnect();
      emit(ReadingGoogleSignOutState());
    } catch (e) {
      print(e);
    }
  }

// ------------ Email ------------
  late UserCredential userCredential;

  Future emailSignUp({required String email, required String password}) async {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    emit(ReadingEmailSignUpState());
  }
// ------------ Facebook ------------
//   var userData;
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future facebookLogin() async {
//     final LoginResult loginResult =
//         await FacebookAuth.instance.login(permissions: [
//       "email,",
//     ]);
//     if (loginResult == LoginStatus.success) {
//       userData = await FacebookAuth.instance.getUserData();
//     } else {
//       print(loginResult.message);
//     }
//
//     emit(ReadingFacebookSignOutState());
//     final OAuthCredential oAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);
//     return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
//   }

// ------------ Profile Screen Section ------------

//
// Widget threeDotsMenu(context) {
//   return PopupMenuButton<String>(
//       onSelected: _onSelect,
//       itemBuilder: (BuildContext context) {
//         return _myMenuItems.map((String choice) {
//           return PopupMenuItem<String>(
//             child: Text(choice),
//             value: choice,
//           );
//         }).toList();
//       });
// }

}
