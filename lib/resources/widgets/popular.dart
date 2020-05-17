import 'package:flutter/material.dart';
import 'package:toko_roti/resources/popularext.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 32.0),
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.asset(populars[index].image),
                Text(
                  populars[index].name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  populars[index].price,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}