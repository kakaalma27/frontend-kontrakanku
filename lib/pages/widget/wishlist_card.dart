import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor1,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_house1.png',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kontrakan',
                  style: blackColorStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Rp. 450.000',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          Image.asset('assets/IC_Bookmark.png')
        ],
      ),
    );
  }
}
