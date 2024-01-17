import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  String verificationId = '';
  late String otpCode;
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSex = TextEditingController();

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    print(phoneNumber);
    emit(LoadingState());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorState(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');

    try {
      this.verificationId = verificationId;
      emit(PhoneNumberSubmitedState());
    } on Exception catch (e) {
      print("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
      print(e.toString());
    }
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(OtpVerifiedState());
    } catch (error) {
      emit(ErrorState(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

  Future<void> tapNextButton(
      BuildContext context,
      GlobalKey<FormState> phoneFormKey,
      TextEditingController phoneController) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));

    if (phoneFormKey.currentState!.validate()) {
      phoneFormKey.currentState!.save();
      submitPhoneNumber(phoneController.text);
      emit(
          PhoneNumberSubmitedState()); // fire bloc listener to handle that state
    } else {
      // entered unvalid phone number
      emit(ExitLoadingState());
    }
  }

  Future<void> tapSubmitButton() async {
    emit(LoadingState());

    if (fieldOne.text.isEmpty ||
        fieldTwo.text.isEmpty ||
        fieldThree.text.isEmpty ||
        fieldFour.text.isEmpty ||
        fieldFive.text.isEmpty ||
        fieldSex.text.isEmpty) {
      emit(ErrorState(errorMsg: "Please fill in all fields"));
      return;
    }

    otpCode = fieldOne.text +
        fieldTwo.text +
        fieldThree.text +
        fieldFour.text +
        fieldFive.text +
        fieldSex.text;

    submitOTP(otpCode);
  }
}
