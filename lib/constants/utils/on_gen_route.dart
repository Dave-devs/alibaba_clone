import 'package:alibaba_clone/presentation/authentication/screens/login_page.dart';
import 'package:alibaba_clone/presentation/authentication/screens/register_page.dart';
import 'package:alibaba_clone/presentation/dimension/layout_buider.dart';
import 'package:alibaba_clone/presentation/mobile_screen/mobile_screen.dart';
import 'package:alibaba_clone/presentation/web_screen/web_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {

    case RegisterPage.routeName:
     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const RegisterPage()
    );
    
    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage()
      );
    
    case ScreenLayoutDimension.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ScreenLayoutDimension( webScreen: WebScreen(), mobileScreen: MobileScreen(),)
      );
    
    case MobileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MobileScreen()
      );

    case WebScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const WebScreen()
      );
    
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