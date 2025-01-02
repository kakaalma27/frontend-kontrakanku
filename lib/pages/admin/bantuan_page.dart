import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class BantuanPage extends StatefulWidget {
  @override
  State<BantuanPage> createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  final List<Map<String, dynamic>> bantuanData = [
    {
      "no": 1,
      "nama": "Alma M.A",
      "Kontrakan": 05,
      "Title": "Toilet Mampet",
      "Deskripsi": "Toilet mampet tiba tiba",
      "Aksi": "Balas",
    },
    {
      "no": 2,
      "nama": "Fariz S.A",
      "Kontrakan": 07,
      "Title": " 2024 - 01 - 07",
      "Deskripsi": "2024 - 02 - 07",
      "Aksi": "Balas",
    },
    {
      "no": 3,
      "nama": "Gilang D.A",
      "Kontrakan": 02,
      "Title": "2024 - 01 - 22",
      "Deskripsi": "2024 - 02 - 22",
      "Aksi": "Balas",
    },
  ];

  List<Map<String, dynamic>> filteredData = [];
  String searchQuery = "";
  @override
  void initState() {
    super.initState();
    filteredData = bantuanData;
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredData = bantuanData
          .where((item) =>
              item['nama'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor4,
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

    Widget searchBar() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: handleSearch,
                decoration: InputDecoration(
                  hintText: 'Cari nama',
                  hintStyle: secondaryTextStyle.copyWith(fontSize: 14),
                  filled: true,
                  fillColor: bgColor2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
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

    Widget tableHeader() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        color: bgColor4,
        child: Row(
          children: [
            SizedBox(width: 50, child: Text('No', style: headerTextStyle())),
            SizedBox(width: 150, child: Text('Nama', style: headerTextStyle())),
            SizedBox(
                width: 100, child: Text('Kontrakan', style: headerTextStyle())),
            SizedBox(
                width: 100, child: Text('Title', style: headerTextStyle())),
            SizedBox(
                width: 100, child: Text('Deskripsi', style: headerTextStyle())),
            SizedBox(width: 100, child: Text('Aksi', style: headerTextStyle())),
          ],
        ),
      );
    }

    Widget tableContent() {
      return Column(
        children: filteredData.map((item) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
            decoration: BoxDecoration(
              color: bgColor4,
            ),
            child: Row(
              children: [
                SizedBox(
                    width: 50,
                    child: Text('${item['no']}', style: contentTextStyle())),
                SizedBox(
                    width: 150,
                    child: Text(item['nama'], style: contentTextStyle())),
                SizedBox(
                    width: 100,
                    child: Text('${item['Kontrakan']}',
                        style: contentTextStyle())),
                SizedBox(
                    width: 100,
                    child: Text('${item['Title']}', style: contentTextStyle())),
                SizedBox(
                    width: 100,
                    child: Text('${item['Deskripsi']}',
                        style: contentTextStyle())),
                SizedBox(
                    width: 100,
                    child: Text('${item['Aksi']}', style: contentTextStyle())),
              ],
            ),
          );
        }).toList(),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header() as PreferredSizeWidget,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  tableHeader(),
                  tableContent(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
