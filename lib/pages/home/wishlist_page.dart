import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget/wishlist_card.dart';
import 'package:frontend_kontrakan/theme.dart';

class WishlistPage extends StatelessWidget {
  Widget header() {
    return AppBar(
      backgroundColor: bgColor4,
      centerTitle: true,
      title: Text(
        'Bookmark',
        style: primaryTextStyle,
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  Widget emptyLisy() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: bgColor1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/IC_Bookmarkk.png',
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'You don\'t have favorit house?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorit house',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore House',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Container(
        color: bgColor1,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            WishlistCard(),
            WishlistCard(),
            WishlistCard(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Column(
        children: [
          header(),
          // emptyLisy(),
          // Uncomment content() when needed
          content(),
        ],
      ),
    );
  }
}
