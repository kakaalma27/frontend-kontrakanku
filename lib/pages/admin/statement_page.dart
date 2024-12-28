import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class StatementPage extends StatelessWidget {
  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Statement Keuangan',
        style: primaryTextStyle.copyWith(fontSize: 18),
      ),
    );
  }

  Widget uangMasuk() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Desember',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '1 - 30 Des 2024',
            style: subtitleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terima Uang',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Rp. 2.250.000',
                  style: priceTextStyle.copyWith(
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

  Widget cardCash() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor2, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.asset(
            'assets/cash-marker.png',
            width: 40,
            height: 40,
            color: primaryTextColor,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tunai',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Rp 1.250.000',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget otomatisCash() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor2, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.asset(
            'assets/cash-fast.png',
            width: 40,
            height: 40,
            color: primaryTextColor,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Rp 1.250.000',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget transferCash() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor2, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.asset(
            'assets/account-cash-outline.png',
            width: 40,
            height: 40,
            color: primaryTextColor,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Otomatis',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Rp 1.250.000',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buttonExport() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: defaultMargin,
      ),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            'Download PDF',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: regular,
            ),
          )),
    );
  }

  Widget content() {
    return Column(
      children: [
        uangMasuk(),
        cardCash(),
        transferCash(),
        otomatisCash(),
        Spacer(),
        buttonExport()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(context) as PreferredSizeWidget,
      body: content(),
    );
  }
}
