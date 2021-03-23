import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableCard extends StatelessWidget {
  final String cardName;
  final Color cardColor;
  final IconData cardIcon;
  final bool isHorizontal;
  final String cardPrice;
  final Function onCardTap;
  ReusableCard(
      {this.cardName,
      this.cardColor,
      this.cardIcon,
      this.isHorizontal,
      this.cardPrice,
      this.onCardTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 10,
          //   left: 15,
          right: isHorizontal ? 10 : 0,
        ),
        width: 135,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor,
          //shape: BoxShape.circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Hero(
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
              SizedBox(
                height: 10,
              ),
              Text(
                cardName,
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                cardPrice,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
