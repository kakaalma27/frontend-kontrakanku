import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:frontend_kontrakan/models/user_models.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;

    handleUpdate() async {
      if (await authProvider.updateProfile(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Update Berhasil')),
        );
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: bgColor3,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: primaryTextColor,
          icon: Icon(Icons.close),
        ),
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              handleUpdate();
            },
            color: primaryColor,
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: '${user.name}',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: '${user.username}',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: '${user.email}',
                hintStyle: blackColorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://ui-avatars.com/api/?name=p+a&color=7F9CF5&background=EBF4FF"),
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header() as PreferredSizeWidget,
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
