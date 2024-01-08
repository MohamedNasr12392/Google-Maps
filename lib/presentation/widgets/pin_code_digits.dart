import 'package:flutter/material.dart';
import 'package:google_maps/presentation/widgets/otp_digit.dart';

class PinCodeDigits extends StatelessWidget {
  PinCodeDigits({
    super.key,
  });

  final TextEditingController _fieldOne   =   TextEditingController();
  final TextEditingController _fieldTwo   =   TextEditingController();
  final TextEditingController _fieldThree =   TextEditingController();
  final TextEditingController _fieldFour  =   TextEditingController();
  final TextEditingController _fieldFive  =   TextEditingController();
  final TextEditingController _fieldSex   =   TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpDigit(
          otpController: _fieldOne,
          autoFocus: true,
        ),
        OtpDigit(
          otpController: _fieldTwo,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: _fieldThree,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: _fieldFour,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: _fieldFive,
          autoFocus: false,
        ),
        OtpDigit(
          otpController: _fieldSex,
          autoFocus: false,
        ),
      ],
    );
  }
}
