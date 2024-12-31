import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class HomeAdminCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget statistikBulanan(String persen, String bulan) {
      final screenWidth = MediaQuery.of(context).size.width;
      final itemWidth = (screenWidth - (defaultMargin * 2) - 24) / 3;

      return Container(
        width: itemWidth,
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              persen,
              style: blackColorStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              bulan,
              style: blackColorStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget bulanan(BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor3,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistik Bulanan',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: statistikBulanan('70%', 'Jan')),
                SizedBox(width: 8),
                Expanded(child: statistikBulanan('80%', 'Feb')),
                SizedBox(width: 8),
                Expanded(child: statistikBulanan('90%', 'Mar')),
              ],
            ),
          ],
        ),
      );
    }

    Widget infoCard(String title, String value, String routeName) {
      final screenWidth = MediaQuery.of(context).size.width;
      final cardWidth =
          (screenWidth - (defaultMargin * 2) - 16) / 2; // Responsif width
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
            color: bgColor3,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: bgColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: blackColorStyle.copyWith(
                    fontSize: 17,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                value,
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        bulanan(context),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoCard('Bantuan', '8', ''),
              infoCard('Booking', '12', ''),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoCard('Penyewa', '7', '/penyewa'),
              infoCard('Pembayaran', '2', '/pembayaran'),
            ],
          ),
        ),
      ],
    );
  }
}
