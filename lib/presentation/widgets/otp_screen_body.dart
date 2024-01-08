import 'package:flutter/material.dart';
import 'package:google_maps/app_router.dart';
import 'package:google_maps/presentation/widgets/next_and_submit_button.dart';
import 'package:google_maps/presentation/widgets/otp_texts.dart';
import 'package:google_maps/presentation/widgets/pin_code_digits.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const OtpTexts(
                phoneNumber: '01067619364',
              ),
              const SizedBox(
                height: 88,
              ),
              PinCodeDigits(),
              const SizedBox(
                height: 60,
              ),
              NextAndSubmitButton(
                buttonTextValue: 'Submit',
                onPressedAction: () {},
              )
            ]));
  }
}
