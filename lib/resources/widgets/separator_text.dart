import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:toko_roti/resources/constants.dart';

class SeparatorText extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 400.0, height: 810, allowFontScaling: true);
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ),
            Text("Or", style: TStyle.separator),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}