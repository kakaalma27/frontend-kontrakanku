import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/models/user_models.dart';
import 'package:frontend_kontrakan/pages/widget/house_product.dart';
import 'package:frontend_kontrakan/pages/widget/house_tile.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    overflow: TextOverflow.ellipsis,
                    style: blackColorStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '${user.username}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(width: 10), // Menambahkan jarak antara teks dan gambar
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/seed/picsum/54/54",
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget Categoris() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'Cari Tempat Ternyaman Untuk Tinggal',
          style: blackColorStyle.copyWith(
            fontSize: 25,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget PopullarHouse() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  HouseProduct(),
                  HouseProduct(),
                  HouseProduct(),
                  HouseProduct(),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget NewArrivalTitle(context) {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Saran',
              style: blackColorStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/readmore');
                },
                child: Text(
                  'Selengkapnya',
                  style: secondaryTextStyle,
                ))
          ],
        ),
      );
    }

    Widget NewArrival() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: [
            HouseTile(),
            HouseTile(),
            HouseTile(),
            HouseTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        Categoris(),
        PopullarHouse(),
        NewArrivalTitle(context),
        NewArrival(),
      ],
    );
  }
}
