import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget/notif_card.dart';
import 'package:frontend_kontrakan/theme.dart';

class NotifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor4,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: primaryTextColor,
          icon: Icon(Icons.close),
        ),
        title: Text(
          'Notifikasi', // Perbaikan kutip
          style: primaryTextStyle,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyNotif() {
      return Container(
        width: double.infinity,
        color: bgColor1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/notif.png',
              width: 80,
              height: 80,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              'You don\'t have Notification',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        color: bgColor1,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin), // Nama variabel diperbaiki
          children: [
            NotifCard(),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          // Expanded(
          //   child: emptyNotif(),
          // ),
          Expanded(
            child: content(),
          )
        ],
      ),
    );
  }
}
