import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class BantuanPage extends StatelessWidget {
  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      title: Text(
        'Bantuan',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(context) as PreferredSizeWidget,
      // body: content(),
    );
  }
}
