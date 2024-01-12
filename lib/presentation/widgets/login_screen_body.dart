import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps/app_router.dart';
import 'package:google_maps/constants/strings.dart';
import 'package:google_maps/presentation/widgets/intro_text.dart';
import 'package:google_maps/presentation/widgets/next_and_submit_button.dart';
import 'package:google_maps/presentation/widgets/phone_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({
    super.key,
  });

  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  TextEditingController phoneFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
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
            NextAndSubmitButton(
              buttonTextValue: "Next",
              onPressedAction: () {
                if (_phoneFormKey.currentState!.validate()) {
                  _phoneFormKey.currentState!.save();
                  GoRouter.of(context).push(Strings.kOtpView,
                      extra: phoneFieldController.text );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
