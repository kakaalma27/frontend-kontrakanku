import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class TambahAlamat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget tambah() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: blackColorStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Nama Lengkap',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Nomber Telepon',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Provinsi, Kota, Kecamatan, Kode Pos',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Nama Jalan, Gedung, No. RUmah',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Detail Lainnya',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    }

    Widget buttonSimpan() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: bgColor1,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add, // Ikon plus
                size: 24, // Ukuran ikon
                color: blackColor, // Warna ikon, sesuaikan dengan tema Anda
              ),
              SizedBox(width: 8), // Jarak antara ikon dan teks
              Text(
                'Simpan',
                style: blackColorStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor2,
      appBar: AppBar(
        backgroundColor: bgColor4,
        centerTitle: true,
        title: Text(
          'Tambah Alamat',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tambah(),
            buttonSimpan(),
          ],
        ),
      ),
    );
  }
}
