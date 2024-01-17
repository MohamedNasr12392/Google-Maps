import 'package:flutter/material.dart';
import 'package:google_maps/bussiness_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:google_maps/presentation/widgets/otp_digit.dart';

class PinCodeDigits extends StatelessWidget {
  const PinCodeDigits({super.key, required this.phoneAuthCubit});
  final PhoneAuthCubit phoneAuthCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpDigit(
          otpController: phoneAuthCubit.fieldOne,
          autoFocus: true,
        ),
        OtpDigit(
          otpController: phoneAuthCubit.fieldTwo,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: phoneAuthCubit.fieldThree,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: phoneAuthCubit.fieldFour,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: phoneAuthCubit.fieldFive,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: phoneAuthCubit.fieldSex,
          autoFocus: false,
        ),
      ],
    );
  }
}
