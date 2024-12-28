import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class HouseDetail extends StatelessWidget {
  Widget viewImage(context) {
    return Container(
      width: 355,
      height: 285,
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(
          image: AssetImage('assets/image_house1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DreamsVille House',
                  style: primaryTextStyle.copyWith(
                    fontSize: 21,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Jl. Manonjaya',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/IC_Bed.png',
                      width: 26,
                      height: 26,
                    ),
                    Text(
                      '4 Kamar Tidur',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/IC_Bath.png',
                      width: 26,
                      height: 26,
                    ),
                    Text(
                      '2 Wc',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10, // Atur jarak dari atas
            right: 10, // Atur jarak dari kanan
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/bookmark');
              },
              child: Image.asset(
                'assets/IC_Bookmark.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.only(
          top: defaultMargin, right: defaultMargin, left: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: blackColorStyle.copyWith(
              fontSize: 17,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The 3 level house that has a modern design, has a large pool and a garage that fits up',
            style: secondaryTextStyle.copyWith(
              fontSize: 13,
              fontWeight: regular,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget hubOwner() {
    return Container(
      padding: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/Profile.png',
            width: 54,
            height: 54,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alma Muhamad A',
                style: blackColorStyle.copyWith(
                  fontSize: 17,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Pemilik Kontrakan',
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                ),
              )
            ],
          ),
          Image.asset(
            'assets/whatsapp.png',
            width: 38,
          ),
        ],
      ),
    );
  }

  Widget galer() {
    return Container(
      padding: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gallery',
            style: blackColorStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                imageGallery(),
                imageGallery(),
                imageGallery(),
                imageGallery(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget imageGallery() {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/house_facilities2.png',
          width: 78,
          height: 78,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget alamat(context) {
    return Container(
      padding: EdgeInsets.only(
          right: defaultMargin, left: defaultMargin, top: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat',
            style: blackColorStyle.copyWith(fontSize: 13),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Jl. Manonjaya Kelurahan manonjaya Rt 01 Rw 07',
            style: secondaryTextStyle.copyWith(
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Price',
            style: blackColorStyle.copyWith(fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp. 450.000/Bulan',
                style: priceTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booking');
                },
                style: TextButton.styleFrom(
                  backgroundColor: blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Booking',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewImage(context),
              content(),
              hubOwner(),
              galer(),
              alamat(context),
            ],
          ),
        ),
      ),
    );
  }
}
