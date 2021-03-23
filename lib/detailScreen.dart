import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String cardName;
  final IconData cardIcon;
  DetailScreen({this.cardName, this.cardIcon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: cardName,
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              cardIcon,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
