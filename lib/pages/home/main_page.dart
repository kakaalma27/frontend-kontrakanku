import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/home/home_page.dart';
import 'package:frontend_kontrakan/pages/home/profile_page.dart';
import 'package:frontend_kontrakan/pages/home/wishlist_page.dart';
import 'package:frontend_kontrakan/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: bgColor1,
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
                    'assets/bookmark-outline.png',
                    width: 25,
                  )),
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
          return HomePage();
        case 1:
          return WishlistPage();
        case 2:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: bgColor1,
        bottomNavigationBar: customBottomNav(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: body());
  }
}
