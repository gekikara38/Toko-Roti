import 'package:flutter/material.dart';
import 'package:toko_roti/resources/drawer/draweritem.dart';

Widget createDrawerHeader() {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      /*image: DecorationImage(
        image: AssetImage('assets/images/app_logo.png'),
        fit: BoxFit.fill,
      ),*/
      color: Color.fromRGBO(87, 128, 217, 1),
    ),
    accountName: Text(
      '@Onanymous69',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    accountEmail: Text(
      'onanymous@gmail.com',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    currentAccountPicture: CircleAvatar(
      child: IconButton(
        icon: new Image.asset('assets/profiles/aq.jpg'),
        onPressed: () {},
      ),
    ),
  );
}

Widget createDrawerItem(int index) {
  return ListTile(
    title: Row(
      children: <Widget>[
        draweritems[index].icons,
        Padding(padding: EdgeInsets.only(right: 16.0),),
        draweritems[index].title,
      ],
    ),
    trailing: Icon(Icons.arrow_forward_ios),
  );
}