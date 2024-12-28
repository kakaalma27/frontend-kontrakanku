import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        int? role = authProvider.user.role;

        if (role == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (role == 1) {
          Navigator.pushNamed(context, '/home-admin');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Role tidak dikenal')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Login gagal, periksa email dan password Anda')),
        );
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: blackColorStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text('Masuk untuk melanjutkan', style: subtitleTextStyle),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Alamat Email',
                style:
                    blackColorStyle.copyWith(fontSize: 16, fontWeight: medium)),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset('assets/email-outline.png', width: 20),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      style: blackColorStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Alamat Email',
                          hintStyle: subtitleTextStyle),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kata Sandi',
                style:
                    blackColorStyle.copyWith(fontSize: 16, fontWeight: medium)),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset('assets/lock-outline.png', width: 20),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      style: blackColorStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Kata Sandi', hintStyle: subtitleTextStyle),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget signButton() {
      return Container(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: handleSignIn,
          style: TextButton.styleFrom(
            backgroundColor: blackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text('Sign In',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: semiBold)),
        ),
      );
    }

    Widget forgetPassword() {
      return Container(
        margin: EdgeInsets.only(top: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onDoubleTap: () {
                Navigator.pushNamed(context, '/check-email');
              },
              child: Text(
                'Lupa Password?',
                style: purpleTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Belum Mempunyai Akun? ',
                style: subtitleTextStyle.copyWith(fontSize: 12)),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text('Daftar',
                  style: purpleTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              forgetPassword(),
              signButton(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
