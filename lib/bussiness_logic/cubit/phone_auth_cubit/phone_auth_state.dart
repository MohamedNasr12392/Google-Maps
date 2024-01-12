part of 'phone_auth_cubit.dart';

sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class LoadingState extends PhoneAuthState {}

final class SubmitPhoneNumberState extends PhoneAuthState {}

final class OtpVerifiedState extends PhoneAuthState {}

final class ErrorState extends PhoneAuthState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
