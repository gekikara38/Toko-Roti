import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget{
  DefaultAppBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: new Material(
                  shape: new CircleBorder(),
                  child: IconButton(
                    icon: new Image.asset('assets/icons/logo.png'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          /*leading: GestureDetector(
            onTap: () {

            },
            child: Icon(
              Icons.menu
            ),
          ),*/
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}