import 'package:flutter/material.dart';
import 'package:google_maps/constants/my_colors.dart';

class OtpTexts extends StatelessWidget {
  const OtpTexts({super.key , required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your phone numberr',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
                text: 'Enter your 6 digits code numbers sent to you at \n',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '+2$phoneNumber',
                    style: const TextStyle(
                      color: MyColors.blue,
                      fontSize: 16
                    )
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
