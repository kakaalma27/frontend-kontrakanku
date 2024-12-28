import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class HouseProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-house');
      },
      child: Container(
        width: 237,
        height: 290,
        margin: EdgeInsets.only(
          right: defaultMargin,
          top: defaultMargin,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('assets/image_house1.png'),
              fit: BoxFit.cover,
            )),
        child: Container(
          padding: EdgeInsets.only(top: 210, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DreamsVille House',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Jl. Manonjaya',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/IC_Bed.png',
                    width: 26,
                    height: 26,
                  ),
                  Text(
                    '4 Kamar Tidur',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/IC_Bath.png',
                    width: 26,
                    height: 26,
                  ),
                  Text(
                    '2 Wc',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
