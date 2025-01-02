import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:frontend_kontrakan/models/user_models.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;
    void handleLogout() async {
      bool success = await authProvider.logout();
      if (success) {
        Navigator.pushReplacementNamed(context, '/sign-in');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal logout!')),
        );
      }
    }

    Widget headerAppBar(BuildContext context) {
      return AppBar(
        backgroundColor: bgColor3,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                ClipOval(
                  child: Image.network(
                    "https://picsum.photos/seed/picsum/54/54",
                    width: 54,
                    height: 54,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.name?.split(' ')[0] ?? 'Guest'}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '@${user.username}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    handleLogout();
                  },
                  color: alertColor,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: blackColor,
            )
          ],
        ),
      );
    }

    Widget Content(BuildContext context) {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(color: bgColor1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Akun',
                style: blackColorStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: menuItem('Edit Profile'),
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                child: menuItem('House'),
                onTap: () {
                  Navigator.pushNamed(context, '/house');
                },
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                child: menuItem('Alamat Saya'),
                onTap: () {
                  Navigator.pushNamed(context, '/alamat');
                },
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                child: menuItem(
                  'Notifikasi',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/notif');
                },
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                child: menuItem(
                  'Bantuan',
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/help');
                },
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                'General',
                style: blackColorStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              menuItem('Privacy & Policy'),
              SizedBox(
                height: 5,
              ),
              menuItem('Term of Servis'),
              SizedBox(
                height: 5,
              ),
              menuItem('Rate App'),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        headerAppBar(context),
        Content(context), // Pass context here
      ],
    );
  }
}
