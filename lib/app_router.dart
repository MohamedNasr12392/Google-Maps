import 'package:go_router/go_router.dart';
import 'package:google_maps/constants/strings.dart';
import 'package:google_maps/presentation/screens/login_screen.dart';
import 'package:google_maps/presentation/screens/otp_screen.dart';

abstract class AppRouter {
// GoRouter configuration

  

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Strings.kLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Strings.kOtpView,
        builder: (context, state) => const OtpScreen(),
      ),
    ],
  );
}
