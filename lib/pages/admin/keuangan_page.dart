import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class KeuanganPage extends StatelessWidget {
  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor3,
      centerTitle: true,
      title: Text(
        'Keuangan',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
        ),
      ),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
    );
  }

  Widget category(context) {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/target-keuangan');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/target.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Target',
                  style: blackColorStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/pemasukan-keuangan');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/pemasukan.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Pemasukan',
                  style: blackColorStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardHeader(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/statement-keuangan');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bulan ini',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            Row(
              children: [
                Text(
                  '+Rp2.250.000',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                Image.asset(
                  'assets/forwardburger.png',
                  width: 28,
                  height: 28,
                  color: primaryTextColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget listCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/masuk.png',
              width: 45,
              height: 45,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terima Uang',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '08 Des 2024 - 15:40',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Rp450.000',
              style: priceTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
            Image.asset(
              'assets/cash-check.png',
              width: 28,
              color: priceColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget cardBody() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: bgColor2,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            listCard(),
            listCard(),
            listCard(),
            listCard(),
          ],
        ),
      ),
    );
  }

  Widget cardContent(context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            cardHeader(context),
            cardBody(),
          ],
        ),
      ),
    );
  }

  Widget content(context) {
    return Column(
      children: [
        category(context),
        cardContent(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(context) as PreferredSizeWidget,
      // bottomNavigationBar: costomBattoNav(),
      body: content(context),
    );
  }
}
