import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTabCard extends StatelessWidget {
  final String cardName;
  final Color cardColor;
  final IconData cardIcon;
  final bool isHorizontal;
  final String cardPrice;
  ReusableTabCard(
      {this.cardName,
      this.cardColor,
      this.cardIcon,
      this.isHorizontal,
      this.cardPrice});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                cardIcon,
                size: 50,
              ),
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cardColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardName,
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    cardPrice,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
