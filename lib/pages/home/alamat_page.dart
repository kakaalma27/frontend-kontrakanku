import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';

class AlamatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget tambahAlamatBaru() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/tambah-alamat');
        },
        child: Container(
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
                'Tambah Alamat',
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

    Widget alamatSaya() {
      return Container(
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Alma Muhamad Apriana',
                    overflow: TextOverflow.ellipsis,
                    style: blackColorStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '(+62) 851-2140-0143',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Jl. Awipari 1 rt 2 rw 7 Rumah Hj Adang',
              style: blackColorStyle.copyWith(
                fontSize: 14,
              ),
            ),
            Text(
              'CIBEUREUM, KOTA TASIKMALAYA, JAWA BARAT, ID 46196',
              style: blackColorStyle.copyWith(
                fontSize: 14,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor2,
      appBar: AppBar(
        backgroundColor: bgColor4,
        centerTitle: true,
        title: Text(
          'Alamat Saya',
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
            Text(
              'Alamat',
              style: blackColorStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 20),
            alamatSaya(),
            tambahAlamatBaru(),
          ],
        ),
      ),
    );
  }
}
