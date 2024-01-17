import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps/bussiness_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:google_maps/constants/strings.dart';
import 'package:google_maps/functions.dart';
import 'package:google_maps/presentation/widgets/custom_button.dart';
import 'package:google_maps/presentation/widgets/otp_texts.dart';
import 'package:google_maps/presentation/widgets/pin_code_digits.dart';

class OtpScreenBody extends StatelessWidget {
  OtpScreenBody({super.key, required this.phoneNumber});

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  final String phoneNumber;

  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneAuthCubit>(
      create: (context) => phoneAuthCubit,
      child: BlocListener<PhoneAuthCubit, PhoneAuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is LoadingState) {
            showProgressIndicator(context);
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMsg),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 5),
            ));
          } else if (state is OtpVerifiedState) {
            GoRouter.of(context).pushReplacementNamed(Strings.kMapScreen);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTexts(
                  phoneNumber: phoneNumber,
                ),
                const SizedBox(
                  height: 88,
                ),
                PinCodeDigits(phoneAuthCubit: phoneAuthCubit),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  buttonTextValue: 'Submit',
                  onPressedAction: () {
                    phoneAuthCubit.tapSubmitButton();
                  },
                )
              ]),
        ),
      ),
    );
  }
}
