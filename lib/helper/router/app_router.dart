import 'package:approutertrial/presentation/screens/screen_one.dart';
import 'package:approutertrial/presentation/screens/screen_two.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const ScreenOne());
      case secondScreen:
        return MaterialPageRoute(builder: (_) => const ScreenTwo());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
