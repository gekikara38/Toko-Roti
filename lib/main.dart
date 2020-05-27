import 'package:flutter/material.dart';
import 'package:toko_roti/services/authentication.dart';
import 'package:toko_roti/pages/root_page.dart';
import 'resources/constants.dart';
import 'resources/router.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: CPalette.primaryColor,
      ),
      title: 'BabaKery',
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/',
    );
  }
}

