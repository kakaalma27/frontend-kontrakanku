import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/widget/readmore.dart';
import 'package:frontend_kontrakan/theme.dart';

class ReadmorePage extends StatelessWidget {
  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor4,
      centerTitle: true,
      title: Text(
        'Kontrakan',
        style: primaryTextStyle,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      elevation: 0,
      automaticallyImplyLeading: true,
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari kontrakan...',
          hintStyle: secondaryTextStyle,
          prefixIcon: Icon(Icons.search, color: secondaryColor),
          filled: true,
          fillColor: bgColor2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // Tambahkan logika pencarian di sini jika diperlukan
          print('Search query: $value');
        },
      ),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          searchBar(), // Tambahkan searchBar di atas konten
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Readmore()),
                    Expanded(child: Readmore()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(context) as PreferredSizeWidget,
      body: content(),
    );
  }
}
