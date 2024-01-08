import 'package:flutter/material.dart';

class OtpDigit extends StatelessWidget {
  const OtpDigit({super.key, required this.otpController , required this.autoFocus });

  final TextEditingController  otpController ;
  final bool autoFocus ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 40,
      width: 40,
      child: TextField(
        controller: otpController,
        autofocus: autoFocus,
        maxLength: 1,
        cursorColor: Colors.transparent,
        cursorHeight: 0,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        showCursor: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}