import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/admin/home_page_admin.dart';
import 'package:frontend_kontrakan/theme.dart';

class MainPageAdmin extends StatelessWidget {
  const MainPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: HomePageAdmin());
  }
}
