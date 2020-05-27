import 'package:flutter/material.dart';

class DrawerItem {
  final Widget icons;
  final Widget title;

  DrawerItem({this.icons, this.title});
}

List draweritems = [
  DrawerItem(
    icons: Icon(Icons.shopping_basket),
    title: Text('My orders'),
  ),
  DrawerItem(
    icons: Icon(Icons.credit_card),
    title: Text('Cards & wallets'),
  ),
  DrawerItem(
    icons: Icon(Icons.location_on),
    title: Text('Address'),
  ),
  DrawerItem(
    icons: Icon(Icons.notifications),
    title: Text('Notification'),
  ),
  DrawerItem(
    icons: Icon(Icons.bookmark),
    title: Text('Wishlist'),
  ),
  DrawerItem(
    icons: Icon(Icons.person),
    title: Text('Profile'),
  ),
  DrawerItem(
    icons: Icon(Icons.exit_to_app),
    title: Text('Logout'),
  ),
];
