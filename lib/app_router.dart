import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps/bussiness_logic/cubit/phone_auth_cubit/phone_auth_cubit.dart';
import 'package:google_maps/constants/strings.dart';
import 'package:google_maps/presentation/screens/login_screen.dart';
import 'package:google_maps/presentation/screens/map_screen.dart';
import 'package:google_maps/presentation/screens/otp_screen.dart';

abstract class AppRouter {
// GoRouter configuration

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Strings.kLoginScreen,
        builder: (context, state) => BlocProvider<PhoneAuthCubit>.value(
          value: PhoneAuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
          path: Strings.kOtpView,
          builder: (context, state) {
            String phoneNumber = state.extra as String;
            return BlocProvider<PhoneAuthCubit>.value(
              value: PhoneAuthCubit(),
              child: OtpScreen(
                phoneNumber: phoneNumber,
              ),
            );
          }),
      GoRoute(
        path: Strings.kMapScreen,
        builder: (context, state) => const MapScreen(),
      ),
    ],
  );
}
