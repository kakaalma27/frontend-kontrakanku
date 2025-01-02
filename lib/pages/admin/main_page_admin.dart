import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/admin/home_page_admin.dart';
import 'package:frontend_kontrakan/theme.dart';

class MainPageAdmin extends StatefulWidget {
  const MainPageAdmin({super.key});

  @override
  State<MainPageAdmin> createState() => _MainPageAdminState();
}

class _MainPageAdminState extends State<MainPageAdmin> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: bgColor5,
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15, bottom: 5),
                child: Image.asset(
                  'assets/home-outline.png',
                  width: 25,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  child: Image.asset(
                    'assets/account-outline.png',
                    width: 25,
                  )),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePageAdmin();
        case 1:
          return HomePageAdmin();

        default:
          return HomePageAdmin();
      }
    }

    return Scaffold(
        backgroundColor: bgColor1,
        bottomNavigationBar: customBottomNav(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: body());
  }
}
