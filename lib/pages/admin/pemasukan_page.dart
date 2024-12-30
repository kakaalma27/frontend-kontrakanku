import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget_admin/card_pemasukan.dart';
import 'package:frontend_kontrakan/theme.dart';

class PemasukanPage extends StatelessWidget {
  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor3,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Pemasukan Manual',
        style: blackColorStyle.copyWith(fontSize: 18),
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
          CardPemasukan(),
        ],
      ),
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
