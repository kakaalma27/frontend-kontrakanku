import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class Readmore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.asset(
              'assets/image_house1.png',
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              'The Hollies House',
              style: blackColorStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Rp.450.000/Bulan',
              style: priceTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/map-marker-outline.png',
                  width: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Cibeureum',
                  style: blackColorStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
