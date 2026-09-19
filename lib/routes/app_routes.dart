import 'package:go_router/go_router.dart';
import 'package:sellora/binding/homePage.binding.dart';
import 'package:sellora/binding/setup1.binding.dart';
import 'package:sellora/binding/signin.binding.dart';
import 'package:sellora/binding/signup.binding.dart';
import 'package:sellora/pages/homePage.dart';
import 'package:sellora/pages/setup1.dart';
import 'package:sellora/pages/signin.dart';
import 'package:sellora/pages/signup.dart';
import 'package:sellora/pages/splashscreen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/setup1',
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
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (context, state) {
        Signinbinding().dependencies();
        return Signin();
      },
    ),
    //setup1
    GoRoute(
      path: '/setup1',
      name: 'setup1',
      builder: (context, state) {
        Setup1binding().dependencies();
        return Setup1();
      },
    ),

    //homePage
    GoRoute(
      path: '/homePage',
      name: 'homePage',
      builder: (context, state) {
        Homepagebinding().dependencies();
        return Homepage();
      },
    ),
  ],
);
