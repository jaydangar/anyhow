import 'package:AnyHow/category/screens/category_page.dart';
import 'package:AnyHow/home/screens/home_screen.dart';
import 'package:AnyHow/login/screens/loginpage.dart';
import 'package:AnyHow/order/screens/order_page.dart';
import 'package:AnyHow/product/screens/product_screen.dart';
import 'package:flutter/material.dart';

class Routing {
  static const LogInPageRoute = '/login';
  static const HomePageRoute = '/home';
  static const OrderPageRoute = '/order';
  static const CategoryPageRoute = '/category';
  static const ProductPageRoute = '/product';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LogInPageRoute:
        return MaterialPageRoute(
          builder: (context) => LogInPage(),
        );
        break;
      case ProductPageRoute:
        return MaterialPageRoute(
          builder: (context) => ProductPage(),
        );
        break;
      case CategoryPageRoute:
        return MaterialPageRoute(
          builder: (context) => CategoryPage(),
        );
        break;
      case OrderPageRoute:
        return MaterialPageRoute(
          builder: (context) => OrderPage(),
        );
        break;
      case HomePageRoute:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => LogInPage(),
        );
        break;
    }
  }
}
