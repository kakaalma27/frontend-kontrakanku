import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class TargetPage extends StatelessWidget {
  Widget header(context) {
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
        'Target Keuangan',
        style: primaryTextStyle.copyWith(fontSize: 18),
      ),
    );
  }

  Widget totalKontrakan() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Kontrakan',
            style: blackColorStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: bgColor5, borderRadius: BorderRadius.circular(12)),
            child: TextFormField(
              style: blackColorStyle,
              decoration: InputDecoration.collapsed(
                hintText: 'Total Kontrakan',
                hintStyle: subtitleTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget totalUangKontrakan() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Maxsimal Uang diDapatkan',
            style: blackColorStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: bgColor5, borderRadius: BorderRadius.circular(12)),
            child: TextFormField(
              style: blackColorStyle,
              decoration: InputDecoration.collapsed(
                hintText: 'Uang Kontrakan',
                hintStyle: subtitleTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Submit',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalKontrakan(),
          SizedBox(
            height: 12,
          ),
          totalUangKontrakan(),
          SizedBox(
            height: 12,
          ),
          submitButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(context) as PreferredSizeWidget,
      body: content(),
    );
  }
}
