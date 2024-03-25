import 'package:flutter/material.dart';
import 'package:to_do_app2/features/home/presentation/views/add_screen_view.dart';
import 'package:to_do_app2/features/home/presentation/views/home_view.dart';
import 'package:to_do_app2/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:to_do_app2/features/splash/views/splash_view.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    '/onBoarding': (context) => const OnBoardingView(),
    '/home': (context) => const HomeView(),
    '/add': (context) => const AddScreen(),
  };
}
