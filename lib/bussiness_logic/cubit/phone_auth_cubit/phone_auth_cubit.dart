import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> otpAuth(String phoneNumber) async {
    emit(LoadingState());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 20),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    await signIn(credential);
  }

  Future<void> verificationFailed(FirebaseAuthException e) async {
    if (e.code == 'invalid-phone-number') {
      emit(ErrorState(errorMsg: "Please enter valid phone number"));
    } else {
      emit(ErrorState(errorMsg: "Please enter valid phone number"));
    }
  }

  Future<void> codeSent(String verificationId, int? resendToken) async {
    this.verificationId = verificationId;

    emit(SubmitPhoneNumberState());
  }

  Future<void> codeAutoRetrievalTimeout(String verificationId) async {}

  Future<void> otpSubmitted(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );

    await signIn(credential);
  }

  Future <void> signIn(PhoneAuthCredential credential) async{
    try{
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(OtpVerifiedState());
    }catch(error){
      emit(ErrorState(errorMsg: error.toString()));
    }
  }

  Future <void> logOut() async{
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedUser() {
    return FirebaseAuth.instance.currentUser! ;
  }

}
