import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class UserHouse extends StatelessWidget {
  Widget header(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor4,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(
        'Detail Penyewaan',
        style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
      ),
      elevation: 0,
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          color: bgColor2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/image_house1.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rumah Minimalis Modern',
                    style: blackColorStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jl. Merdeka No. 123, Kota Bandung',
                    style: secondaryTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Divider(color: primaryTextColor.withOpacity(0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Penyewa',
                            style: blackColorStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Alma Muhamad A',
                            style: blackColorStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pemilik',
                            style: blackColorStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Alexxin',
                            style: blackColorStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: primaryTextColor.withOpacity(0.5)),
                  Text(
                    'Detail Penyewaan',
                    style: blackColorStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Durasi: 1 bulan',
                    style: blackColorStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Harga: Rp 450.000/bulan',
                    style: blackColorStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
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
