part of 'reading_cubit.dart';

abstract class ReadingState {}

class ReadingInitial extends ReadingState {}

class ReadingGoogleSignInState extends ReadingState {}
class ReadingGoogleSignOutState extends ReadingState {}
// class ReadingFacebookSignOutState extends ReadingState {}
class ReadingGetDataState extends ReadingState {}
class ReadingChangeCategoryState extends ReadingState {}
class ReadingEmailSignUpState extends ReadingState {}
class ReadingEmailSignOutState extends ReadingState {}


