import 'package:flutter/material.dart';
import 'package:toko_roti/services/authentication.dart';
import 'package:toko_roti/pages/root_page.dart';
import 'resources/constants.dart';
import 'resources/router.dart';

//void main() {
//  runApp(new MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        title: 'Flutter login demo',
//        debugShowCheckedModeBanner: false,
//        theme: new ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: new RootPage(auth: new Auth()));
//  }
//}

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

