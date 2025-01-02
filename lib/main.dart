import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/admin/bantuan_page.dart';
import 'package:frontend_kontrakan/pages/admin/keuangan_page.dart';
import 'package:frontend_kontrakan/pages/admin/main_page_admin.dart';
import 'package:frontend_kontrakan/pages/admin/kontrakan_page.dart';
import 'package:frontend_kontrakan/pages/admin/pemasukan_page.dart';
import 'package:frontend_kontrakan/pages/admin/penyewa_page.dart';
import 'package:frontend_kontrakan/pages/admin/statement_page.dart';
import 'package:frontend_kontrakan/pages/admin/target_page.dart';
import 'package:frontend_kontrakan/pages/admin/update_1_page.dart';
import 'package:frontend_kontrakan/pages/admin/update_2_page.dart';
import 'package:frontend_kontrakan/pages/admin/upload_1_page.dart';
import 'package:frontend_kontrakan/pages/admin/upload_2_page.dart';
import 'package:frontend_kontrakan/pages/check_email_page.dart';
import 'package:frontend_kontrakan/pages/home/alamat_page.dart';
import 'package:frontend_kontrakan/pages/home/booking_page.dart';
import 'package:frontend_kontrakan/pages/home/edit_profile_page.dart';
import 'package:frontend_kontrakan/pages/home/help_page.dart';
import 'package:frontend_kontrakan/pages/home/house_detail.dart';
import 'package:frontend_kontrakan/pages/home/main_page.dart';
import 'package:frontend_kontrakan/pages/home/notif_page.dart';
import 'package:frontend_kontrakan/pages/home/readmore_page.dart';
import 'package:frontend_kontrakan/pages/home/transaksi_page.dart';
import 'package:frontend_kontrakan/pages/home/transaksi_success_page.dart';
import 'package:frontend_kontrakan/pages/home/user_house.dart';
import 'package:frontend_kontrakan/pages/home/wishlist_page.dart';
import 'package:frontend_kontrakan/pages/sign_in_page.dart';
import 'package:frontend_kontrakan/pages/sign_up_page.dart';
import 'package:frontend_kontrakan/pages/splash_page.dart';
import 'package:frontend_kontrakan/pages/widget/tambah_alamat.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(), // Initial route is the splash screen
          '/sign-in': (context) => SignInPage(),
          '/check-email': (context) => CheckEmailPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/alamat': (context) => AlamatPage(),
          '/tambah-alamat': (context) => TambahAlamat(),
          '/detail-house': (context) => HouseDetail(),
          '/booking': (context) => BookingPage(),
          '/transaksi': (context) => TransaksiPage(),
          '/transaksi-berhasil': (context) => TransaksiSuccessPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/house': (context) => UserHouse(),
          '/readmore': (context) => ReadmorePage(),
          '/notif': (context) => NotifPage(),
          '/bookmark': (context) => WishlistPage(),
          '/help': (context) => HelpPage(),
          '/home-admin': (context) => MainPageAdmin(),
          '/upload-admin': (context) => KontrakanPage(),
          '/upload-1-admin': (context) => Upload1Page(),
          '/upload-2-admin': (context) => Upload2Page(),
          '/update-1-admin': (context) => Update1Page(),
          '/update-2-admin': (context) => Update2Page(),
          '/keuangan-admin': (context) => KeuanganPage(),
          '/target-keuangan': (context) => TargetPage(),
          '/pemasukan-keuangan': (context) => PemasukanPage(),
          '/statement-keuangan': (context) => StatementPage(),
          '/penyewa': (context) => PenyewaPage(),
          '/bantuan': (context) => BantuanPage(),
        },
      ),
    );
  }
}
