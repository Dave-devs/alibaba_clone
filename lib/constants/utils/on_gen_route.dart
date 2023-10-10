import 'package:alibaba_clone/model/product_model.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/add_product/add_product_page.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/admin_dimension_layout/admin_page_dimension.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/mobileAdminPage/mobile_admin_page.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/webAdminPage/web_admin_page.dart';
import 'package:alibaba_clone/presentation/authentication/screens/login_page.dart';
import 'package:alibaba_clone/presentation/authentication/screens/register_page.dart';
import 'package:alibaba_clone/presentation/cart/cart_page.dart';
import 'package:alibaba_clone/presentation/category/category_page.dart';
import 'package:alibaba_clone/presentation/dimension/layout_buider.dart';
import 'package:alibaba_clone/presentation/home/home_page.dart';
import 'package:alibaba_clone/presentation/mobile_screen/mobile_screen.dart';
import 'package:alibaba_clone/presentation/product_details/product_details_page.dart';
import 'package:alibaba_clone/presentation/profile/profile_page.dart';
import 'package:alibaba_clone/presentation/search/search_page.dart';
import 'package:alibaba_clone/presentation/web_screen/web_screen.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/products/products_page.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/analytic/analytic_page.dart';
import 'package:alibaba_clone/presentation/admin_features/presentation/orders/orders_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RegisterPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const RegisterPage());

    case LoginPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LoginPage());

    case ScreenLayoutDimension.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const ScreenLayoutDimension(
                webScreen: WebScreen(),
                mobileScreen: MobileScreen(),
              ));

    case MobileScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MobileScreen());

    case WebScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const WebScreen());

    case HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomePage());

    case ProfilePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ProfilePage());

    case CartPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const CartPage());

    case AdminScreenLayoutDimension.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AdminScreenLayoutDimension(
                mobileAdminPage: MobileAdminPage(),
                webAdminPage: WebAdminPage(),
              ));

    case ProductsPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ProductsPage());

    case AnalyticPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AnalyticPage());

    // ignore: unreachable_switch_case
    case OrdersPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const OrdersPage());

    case AddProductPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductPage());

    case CategoryDealPage.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealPage(
                category: category,
              ));

    case SearchPage.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchPage(
                searchQuery: searchQuery,
              ));

    case ProductDetailsPage.routeName:
      var product = routeSettings.arguments as ProductModel;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailsPage(
                product: product,
              ));

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
