import 'package:flutter/material.dart';
import 'package:google_maps/constants/my_colors.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({super.key , required this.phoneFieldController});

  final TextEditingController phoneFieldController ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(color: MyColors.lightGrey),
              ),
              child: Row(
                children: [
                  Text(
                    _getCountryFlag(),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '+20',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            autofocus: true,
            keyboardType: TextInputType.phone,
            showCursor: true,
            cursorColor: Colors.black,
            cursorHeight: 20,
            maxLength: 11,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
            decoration: const InputDecoration(
              counterText: '',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please Enter Your Phone Number';
              } else if (value.length < 11) {
                return 'Wrong Phone Number';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              phoneFieldController.text = newValue!;
            },
          ),
        ),
      ],
    );
  }

  String _getCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}
