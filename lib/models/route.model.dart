import 'package:flutter/cupertino.dart';

class RouteModel {
  final String routeName;
  final String routePath;
  final Widget screen;

  RouteModel(
      {required this.routePath, required this.screen, required this.routeName});
}
