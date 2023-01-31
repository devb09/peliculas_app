import 'package:flutter/cupertino.dart';
import 'package:peliculas_app/models/route.model.dart';
import 'package:peliculas_app/screens/home.screen.dart';
import 'package:peliculas_app/screens/screens.dart';

class RoutesApp {
  static const initialRoute = '/home';

  static final routeOptions = <RouteModel>[
    RouteModel(
        routePath: '/details',
        screen: const DetailsScreen(),
        routeName: 'Details')
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'/home': (BuildContext context) => const HomeScreen()});

    for (final option in routeOptions) {
      appRoutes
          .addAll({option.routePath: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
