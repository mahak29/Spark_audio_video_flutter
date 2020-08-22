import 'package:flutter/material.dart';

Color primaryColor = Color(0xffedd3cb);
Color darkPrimaryColor = Color(0xff6f3d2e);

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarItem(
            icon: Icons.arrow_back_ios,
          ),
          Text(
            'Playing Now',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          NavBarItem(
            icon: Icons.list,
          )
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;

  const NavBarItem({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: primaryColor.withOpacity(0.5), blurRadius: 8),
        BoxShadow(color: Colors.white, blurRadius: 10)
      ], color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Icon(icon, color: darkPrimaryColor),
    );
  }
}
