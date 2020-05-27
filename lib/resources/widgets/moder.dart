import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_roti/resources/moderext.dart';

class Moder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //padding: EdgeInsets.only(top: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1.25,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Image.asset(
                      moderns[index].image,
                      fit: BoxFit.contain,
                      //width: 200.0,
                      //height: 200.0,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        moderns[index].name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        moderns[index].price,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'FuturaBold',
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}