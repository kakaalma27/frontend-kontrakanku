import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class PenyewaPage extends StatefulWidget {
  @override
  _PenyewaPageState createState() => _PenyewaPageState();
}

class _PenyewaPageState extends State<PenyewaPage> {
  final List<Map<String, dynamic>> kontrakanData = [
    {
      "no": 1,
      "nama": "Alma M.A",
      "Kontrakan": 05,
      "Masuk": "2024 - 01 - 05",
      "Keluar": "2024 - 01 - 05",
      "Metode": "Cash",
    },
    {
      "no": 2,
      "nama": "Fariz S.A",
      "Kontrakan": 07,
      "Masuk": " 2024 - 01 - 07",
      "Keluar": "2024 - 02 - 07",
      "Metode": "Cash",
    },
    {
      "no": 3,
      "nama": "Gilang D.A",
      "Kontrakan": 02,
      "Masuk": "2024 - 01 - 22",
      "Keluar": "2024 - 02 - 22",
      "Metode": "Otomatis",
    },
  ];

  List<Map<String, dynamic>> filteredData = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredData = kontrakanData;
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredData = kontrakanData
          .where((item) =>
              item['nama'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget header(context) {
    return AppBar(
      backgroundColor: bgColor1,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: primaryTextColor,
        icon: Icon(Icons.close),
      ),
      title: Text(
        'Penyewa',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
        ),
      ),
      elevation: 0,
      centerTitle: true,
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
                hintStyle: primaryTextStyle.copyWith(fontSize: 14),
                filled: true,
                fillColor: bgColor1,
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

  Widget tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
      color: bgColor2,
      child: Row(
        children: [
          SizedBox(width: 50, child: Text('No', style: headerTextStyle())),
          SizedBox(width: 150, child: Text('Nama', style: headerTextStyle())),
          SizedBox(
              width: 100, child: Text('Kontrakan', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Masuk', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Keluar', style: headerTextStyle())),
          SizedBox(width: 100, child: Text('Metode', style: headerTextStyle())),
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
            color: bgColor1,
            borderRadius: BorderRadius.circular(8),
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
                  child:
                      Text('${item['Kontrakan']}', style: contentTextStyle())),
              SizedBox(
                  width: 100,
                  child: Text('${item['Masuk']}', style: contentTextStyle())),
              SizedBox(
                  width: 100,
                  child: Text('${item['Keluar']}', style: contentTextStyle())),
              SizedBox(
                  width: 100,
                  child: Text('${item['Metode']}', style: contentTextStyle())),
            ],
          ),
        );
      }).toList(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(context) as PreferredSizeWidget,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Tambahkan scroll horizontal
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tableHeader(),
                  tableContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
