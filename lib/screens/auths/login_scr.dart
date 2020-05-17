import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_roti/resources/defaultappbar.dart';
import 'package:toko_roti/resources/widgets/responsive_safe_area.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: DefaultAppBar(),
      backgroundColor: Colors.white,
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Center(child: Text("Test Login"));
        },
      ),
    );
  }
}
