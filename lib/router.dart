import 'package:flipcart/Resources/auth/Authentication.dart';
import 'package:flipcart/Screens/Admin/AddProduct.dart';
import 'package:flipcart/Widgets/Bars/BottomBar.dart';
import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthScreen());

            case Home.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Home());

             case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => BottomBar());

             case AddProduct.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AddProduct());
    default:
      return MaterialPageRoute (
          settings: routeSettings,
          builder: (_) => Scaffold(
                body: Center(
                  child: Text("Screen does not exist!"),
                ),
              ));
  }
}
