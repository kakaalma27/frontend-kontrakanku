import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class TransaksiSuccess extends StatelessWidget {
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
                      Image.asset(
                        'assets/Line.png',
                        width: 34,
                        height: 34,
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
                ' Pembayaran Detail',
                style: blackColorStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantity',
                        style: subtitleTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Harga',
                        style: subtitleTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Biaya Admin',
                        style: subtitleTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        '1 items',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Rp. 450.000',
                        style: priceTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Free',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
