import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps/bussiness_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:google_maps/constants/strings.dart';
import 'package:google_maps/functions.dart';
import 'package:google_maps/presentation/widgets/intro_text.dart';
import 'package:google_maps/presentation/widgets/custom_button.dart';
import 'package:google_maps/presentation/widgets/phone_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  TextEditingController phoneFieldController = TextEditingController();

  LoginScreenBody({
    super.key,
  });

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

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
              duration: const Duration(seconds: 15),
            ));
          } else if (state is PhoneNumberSubmitedState) {
            Navigator.pop(context);
            GoRouter.of(context)
                .push(Strings.kOtpView, extra: phoneFieldController.text);
          } else if (state is ExitLoadingState) {
            Navigator.pop(context);
          }
        },
        child: Form(
          key: _phoneFormKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IntroText(),
                const SizedBox(
                  height: 90,
                ),
                PhoneFormField(
                  phoneFieldController: phoneFieldController,
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  buttonTextValue: "Next",
                  onPressedAction: () {
                    phoneAuthCubit.tapNextButton(
                      context,
                      _phoneFormKey,
                      phoneFieldController,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
