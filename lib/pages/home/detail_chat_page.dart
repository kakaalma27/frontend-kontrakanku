import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget/chat_bubble.dart';
import 'package:frontend_kontrakan/theme.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget headerAppBar() {
      return AppBar(
        backgroundColor: bgColor4,
        toolbarHeight: 70, // Atur tinggi AppBar
        centerTitle: false,
        leadingWidth: 0, // Hilangkan padding bawaan leading
        title: Row(
          children: [
            Image.asset(
              'assets/kaka.jpg',
              width: 50,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pemilik Kontrakan',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium, // medium
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                    fontWeight: light, // light
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget houseView() {
      return Container(
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: priceColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image_house2.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'House 1 ...',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Rp. 450.000',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            houseView(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor1,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type message..',
                            hintStyle: subtitleTextStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hallo, apakah kontrakan ini masih ada',
            hasHouse: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Ya, kontrakan ini masih ada',
            hasHouse: false,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: headerAppBar() as PreferredSizeWidget,
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
