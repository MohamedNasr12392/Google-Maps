import 'package:flutter/material.dart';
import 'package:google_maps/presentation/widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key , required this.phoneNumber});

  final String phoneNumber ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body: OtpScreenBody(phoneNumber: phoneNumber,),
      ),
    );
  }
}
