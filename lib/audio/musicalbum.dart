import 'package:flutter/material.dart';

Color primaryColor = Color(0xffedd3cb);
Color darkPrimaryColor = Color(0xff6f3d2e);

class AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 327,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Row(children: <Widget>[
            Image.asset(
              'assets/image/gif3.gif',
              fit: BoxFit.fill,
            ),
          ])),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: darkPrimaryColor, blurRadius: 10),
          BoxShadow(color: Colors.white, blurRadius: 12)
        ],
      ),
    );
  }
}
