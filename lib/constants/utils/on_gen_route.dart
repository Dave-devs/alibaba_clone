import 'package:alibaba_clone/admin_features/presentation/admin_dimension_layout/admin_page_dimension.dart';
import 'package:alibaba_clone/admin_features/presentation/mobileAdminPage/mobile_admin_page.dart';
import 'package:alibaba_clone/admin_features/presentation/webAdminPage/web_admin_page.dart';
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
    
    case AdminScreenLayoutDimension.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminScreenLayoutDimension(mobileAdminPage: MobileAdminPage(), webAdminPage: WebAdminPage(),)
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