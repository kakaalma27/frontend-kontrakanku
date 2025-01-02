import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class HelpPage extends StatelessWidget {
  Widget header(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor3,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Bantuan',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
    );
  }

  Widget kepadainput() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextFormField(
          style: blackColorStyle,
          decoration: InputDecoration.collapsed(
            hintText: 'Pemilik Kontrakan',
            hintStyle: subtitleTextStyle.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget titleinput() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          style: blackColorStyle,
          decoration: InputDecoration.collapsed(
            hintText: 'Judul',
            hintStyle: subtitleTextStyle.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget deskripsiinput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          style: blackColorStyle,
          maxLines: 5,
          decoration: InputDecoration.collapsed(
            hintText: 'Deskripsi',
            hintStyle: subtitleTextStyle.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget submitbutton() {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: blackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Sampaikan Keluhan ke Pemilik',
              style: blackColorStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: defaultMargin),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kepada',
                    style: blackColorStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  kepadainput(),
                  SizedBox(
                    height: 12,
                  ),
                  titleinput(),
                  SizedBox(
                    height: 12,
                  ),
                  deskripsiinput(),
                  SizedBox(
                    height: 12,
                  ),
                  submitbutton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(context) as PreferredSizeWidget,
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
