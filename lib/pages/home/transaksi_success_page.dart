import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget/transaksi_success.dart';
import 'package:frontend_kontrakan/theme.dart';

class TransaksiSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor4,
        centerTitle: true,
        title: Text(
          'Transaksi Berhasil',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
        elevation: 0,
      );
    }

    Widget subTitle() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: Text(
          'List House',
          style: blackColorStyle.copyWith(fontSize: 17, fontWeight: medium),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          subTitle(),
          TransaksiSuccess(),
        ],
      );
    }

    Widget costomBattoNav() {
      return Container(
        height: 165,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: TextButton.styleFrom(
                  backgroundColor: blackColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pembayaran Berhasil',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header() as PreferredSizeWidget,
      bottomNavigationBar: costomBattoNav(),
      body: content(),
    );
  }
}
