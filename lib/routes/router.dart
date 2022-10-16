import 'package:flutter/material.dart';
import 'package:flutter_repositories/views/HomeScreen.dart';


class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final arguments = settings.arguments;

    switch(settings.name) {

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _NotFoundRoute();
    }    
  }

  // ignore: non_constant_identifier_names
  static Route<dynamic> _NotFoundRoute() {

    return MaterialPageRoute(builder: (_) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("Lien introuvable")
        ),
        body: const Center(
          child:  Text("Lien introuvable")
        ),
      );
    });
  }
}