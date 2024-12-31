import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget_admin/home_admin_card.dart';
import 'package:frontend_kontrakan/theme.dart';

class HomePageAdmin extends StatelessWidget {
  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, Owner ',
                  style: blackColorStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '@Owner77',
                  style: subtitleTextStyle.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset('assets/Profile-Default.png'),
            ),
          )
        ],
      ),
    );
  }

  Widget categori(context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: 17,
        right: 17,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/upload-admin');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/upload.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Upload',
                  style: blackColorStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 25),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/keuangan-admin');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/money_admin.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Keuangan',
                  style: blackColorStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 25),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/bantuan');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/bantuan.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Bantuan',
                  style: blackColorStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 25),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/penyewa');
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/penyewa.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'Penyewa',
                  style: blackColorStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return HomeAdminCard(); // Tidak perlu menggunakan Expanded di dalam ListView
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        categori(context),
        body(),
      ],
    );
  }
}
