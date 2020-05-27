import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_roti/resources/defaultappbar.dart';
import 'package:toko_roti/resources/widgets/popular.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Satisfy Your Day With BabaKery',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Futura'
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: TabBar(
                unselectedLabelColor: Colors.black38,
                labelColor: Colors.black87,
                //indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  new Tab(
                    child: Text(
                      'POPULAR',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Futura'
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Tab(
                    child: Text(
                      'MODERN',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Futura'
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Tab(
                    child: Text(
                      'TRADITIONAL',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Futura'
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                controller: _tabController,
                indicatorColor: Colors.brown,
              ),
            ),
            Container(
              child: Expanded(
                child: new TabBarView(
                  children: <Widget>[
                    Popular(),
                    new Center(
                      child : new Text('MODERN ROTI'),
                    ),
                    new Center(
                      child : new Text('TRADITIONAL ROTI'),
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
