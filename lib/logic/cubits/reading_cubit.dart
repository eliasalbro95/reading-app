
import 'package:books_finder/books_finder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reading_app/shared/constants/api_fetch.dart';
import 'package:reading_app/shared/constants/category.dart';

part 'reading_state.dart';

class ReadingCubit extends Cubit<ReadingState> {
  ReadingCubit() : super(ReadingInitial());

// ------------ Initialize Section ------------
  static ReadingCubit get(context) => BlocProvider.of(context);
  bool isGmail = false;



// ---------------------------------
// ------------ Sign In ------------
// ---------------------------------

// ------------ Google ------------
  // ------------ In ------------
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

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
    getCategory(category: category[0].toLowerCase());
    isGmail = true;
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
  // Sign up
  // late UserCredential userCredential;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // var emailUser;
  //
  // Future emailSignUp(
  //     {required String email,
  //     required String password,
  //     required String name}) async {
  //   try {
  //     userCredential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     User user = userCredential.user!;
  //     emailUser = user;
  //     await _create(name: name, password: password, email: email);
  //     // await _getData(email: email);
  //     emit(ReadingEmailSignUpState());
  //     isGmail = false;
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //   }
  //   return;
  // }
  //
  // // get data
  //
  // // Sign in
  // late final emailUserData;
  // bool isMember = false;
  //
  // Future<bool> emailSingIn(
  //     {required String email, required String password}) async {
  //   final _docUser = FirebaseFirestore.instance.collection("users");
  //   final QuerySnapshot snapshot =
  //       await _docUser.where("email", isEqualTo: email).get();
  //   snapshot.docs.forEach((element) {
  //     if (element["email"] == email && element["password"] == password) {
  //       emailUserData = element;
  //       isMember = true;
  //     } else {
  //       isMember = false;
  //     }
  //   });
  //   FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password);
  //   return isMember;
  // }

// ---------------------------------
// ----------- FireStore -----------
// ---------------------------------

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

  void changeCategory(index,category)async{
    selectedCategoryNumber = index;
    emit(ReadingChangeCategoryState());
  }
  Future<void> getCategory({required String category}) async {
    List<Book> books = await queryBooks(category,
        maxResults: 40, printType: PrintType.books, orderBy: OrderBy.newest,reschemeImageLinks: true);
    dataFetched = [];
    for (final book in books){
      dataFetched.add(book.info);
    }
    emit(ReadingGetDataState());
  }
}
// https: //www.googleapis.com/books/v1/volumes?q=subject:sports
