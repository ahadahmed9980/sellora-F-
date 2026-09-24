import 'package:go_router/go_router.dart';
import 'package:sellora/binding/addExpense.binding.dart';
import 'package:sellora/binding/addProduct.binding.dart';
import 'package:sellora/binding/homePage.binding.dart';
import 'package:sellora/binding/setup1.binding.dart';
import 'package:sellora/binding/setup2.binding.dart';
import 'package:sellora/binding/signin.binding.dart';
import 'package:sellora/binding/signup.binding.dart';
import 'package:sellora/pages/addExpense.dart';
import 'package:sellora/pages/addProduct.dart';
import 'package:sellora/pages/homePage.dart';
import 'package:sellora/pages/setup1.dart';
import 'package:sellora/pages/setup2.dart';
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
    //setup2
    GoRoute(
      path: '/setup2',
      name: 'setup2',
      builder: (context, state) {
        Setup2binding().dependencies();
        return Setup2();
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
    //add product
    GoRoute(
      path: '/add-product',
      name: 'addProduct',
      builder: (context, state) {
        AddProductbinding().dependencies();
        return Addproduct();
      },
    ),
    //add expense
    GoRoute(
      path: '/add-expense',
      name: 'addExpense',
      builder: (context, state) {
        Addexpensebinding().dependencies();
        return Addexpense();
      },
    ),
  ],
);
