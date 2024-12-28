import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class Transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/image_house1.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dream House',
                          style: blackColorStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Rp. 450.000',
                          style: priceTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '1 Items',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bgColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Proses Details',
                style: blackColorStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/02.png',
                        width: 34,
                        height: 34,
                      ),
                      Image.asset(
                        'assets/Line.png',
                        width: 34,
                        height: 34,
                      ),
                      Image.asset(
                        'assets/money.png',
                        width: 34,
                        height: 34,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/ceklis.png',
                        width: 34,
                        height: 34,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking diSetujui',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Booking',
                        style: blackColorStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'Payment Pending',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Pembayaran',
                        style: blackColorStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: defaultMargin,
                      ),
                      Text(
                        'Waiting',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Success',
                        style: blackColorStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: defaultMargin,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Metode Pembayaran',
                style: blackColorStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: bgColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: secondaryColor, // Warna lingkaran
                              shape: BoxShape.circle, // Membentuk lingkaran
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Pembayaran Online',
                            style: blackColorStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: bgColor1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: primaryColor, // Warna lingkaran
                              shape: BoxShape.circle, // Membentuk lingkaran
                            ),
                            child: Icon(
                              Icons.check, // Ikon di dalam lingkaran
                              color: Colors.white, // Warna ikon
                              size: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Tunai',
                            style: blackColorStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
