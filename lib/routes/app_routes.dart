import 'package:go_router/go_router.dart';
import 'package:sellora/binding/signup.binding.dart';
import 'package:sellora/pages/signup.dart';
import 'package:sellora/pages/splashscreen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) {
        return const Splashscreen();
      },
    ),
    //signup
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) {
        Signupbinding().dependencies();
        return const Signup();
      },
    ),
  ],
);
