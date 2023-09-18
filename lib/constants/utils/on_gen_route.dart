import 'package:alibaba_clone/presentation/authentication/screens/login_page.dart';
import 'package:alibaba_clone/presentation/authentication/screens/register_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RegisterPage.routeName:
     return MaterialPageRoute(builder: (_) => const RegisterPage());
    
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (_) => const LoginPage());
    
    default:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Screen does not exist!'),
        ),
      ),
    );
  }
}