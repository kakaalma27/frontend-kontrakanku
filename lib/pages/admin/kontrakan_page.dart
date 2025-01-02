import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/models/house_models.dart';
import 'package:frontend_kontrakan/services/house_services.dart';

import 'package:frontend_kontrakan/theme.dart';

class KontrakanPage extends StatelessWidget {
  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor3,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home-admin');
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Kontrakan',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
        ),
      ),
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
      color: bgColor3,
      child: Row(
        children: [
          SizedBox(width: 50, child: Text('No', style: headerTextStyle())),
          SizedBox(width: 150, child: Text('Nama', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Harga', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Total', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Kamar', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Wc', style: headerTextStyle())),
          SizedBox(width: 150, child: Text('Action', style: headerTextStyle())),
        ],
      ),
    );
  }

  Widget tableContent(BuildContext context) {
    return FutureBuilder<List<HouseModels>>(
      future:
          HouseServices().fetchHouses(context), // Fetch houses from the service
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No houses found.'));
        }

        final houses = snapshot.data!;

        return Column(
          children: houses.map<Widget>((house) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin:
                  EdgeInsets.only(left: defaultMargin, right: defaultMargin),
              decoration: BoxDecoration(
                color: blackColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                      width: 50,
                      child: Text('${houses.indexOf(house) + 1}',
                          style: contentTextStyle())),
                  SizedBox(
                      width: 150,
                      child: Text(house.name ?? '', style: contentTextStyle())),
                  SizedBox(
                      width: 100,
                      child: Text('${house.price ?? 0}',
                          style: contentTextStyle())),
                  SizedBox(
                      width: 100,
                      child: Text('${house.quantity ?? 0}',
                          style: contentTextStyle())),
                  SizedBox(
                      width: 100,
                      child: Text('${house.kamar ?? 0}',
                          style: contentTextStyle())),
                  SizedBox(
                      width: 100,
                      child:
                          Text('${house.wc ?? 0}', style: contentTextStyle())),
                  SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/update-${house.id}-admin');
                          },
                          child: Text(
                            'Edit',
                            style:
                                contentTextStyle().copyWith(color: Colors.blue),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Logic to delete the house with pop up
                          },
                          child: Text(
                            'Delete',
                            style:
                                contentTextStyle().copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  TextStyle headerTextStyle() {
    return primaryTextStyle.copyWith(
      fontSize: 14,
      fontWeight: medium,
    );
  }

  TextStyle contentTextStyle() {
    return primaryTextStyle.copyWith(
      fontSize: 12,
    );
  }

  Widget uploadButton(context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: defaultMargin,
        right: defaultMargin,
        bottom: 10,
      ),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/upload-1-admin');
          },
          style: TextButton.styleFrom(
            backgroundColor: bgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Upload Kontrakan',
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(context) as PreferredSizeWidget,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            uploadButton(context),
            tableHeader(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: tableContent(context),
            ),
          ],
        ),
      ),
    );
  }
}
