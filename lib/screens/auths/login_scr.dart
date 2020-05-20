import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_roti/resources/constants.dart';
import 'package:toko_roti/services/authentication.dart';
import 'package:toko_roti/services/root_login.dart' as login;
import 'package:toko_roti/services/root_signup.dart' as sign_up;
import 'package:toko_roti/resources/widgets/responsive_safe_area.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  TabController controller;

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: CPalette.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CPalette.backgroundColor2,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/app_logo.png",
                    scale: 2.5,
                  )
                ],
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.square(300),
            child: TabBar(
                labelStyle: TStyle.title,
                unselectedLabelStyle: TStyle.basic,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("LOGIN"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("SIGN UP"),
                    ),
                  ),
                ]),
          ),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            //kemudian panggil halaman sesuai tab yang sudah dibuat
            new login.RootPage(auth: new Auth()),
            new sign_up.RootPage(auth: new Auth()),
          ],
        ),
      ),
    );
  }
}
