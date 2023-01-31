import 'package:flutter/material.dart';
import 'package:peliculas_app/router/routes_app.dart';
import 'package:peliculas_app/screens/home.screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RoutesApp.initialRoute,
      routes: RoutesApp.getRoutes(),
    );
  }
}
