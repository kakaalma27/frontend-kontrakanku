import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class NotifCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor4,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/AK.png',
            width: 58,
            height: 58,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Horray Pembayaran Anda Berhasil',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Selamat, Pembayaran anda telah Berhasil',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
