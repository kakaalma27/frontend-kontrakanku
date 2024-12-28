import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/services/auth_services.dart';

class NewPasswordPage extends StatefulWidget {
  final String email;
  final String token;

  NewPasswordPage({required this.email, required this.token});

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  void resetPassword() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password dan konfirmasi tidak cocok')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      bool success = await AuthServices().resetPassword(
        email: widget.email,
        token: widget.token,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password berhasil diperbarui')),
        );
        Navigator.pushNamed(context, '/sign-in');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perbarui Password',
              style: blackColorStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Buat kata sandi baru. Pastikan berbeda dari yang sebelumnya untuk keamanan',
              style: subtitleTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      );
    }

    Widget passwordField() {
      return Container(
        margin: EdgeInsets.only(top: 70),
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

    Widget confirmPasswordField() {
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
                      controller: confirmPasswordController,
                      style: blackColorStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Konfirmasi Kata Sandi',
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

    Widget resetButton() {
      return Container(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: isLoading ? null : resetPassword,
          style: TextButton.styleFrom(
            backgroundColor: blackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text('Perbarui Password',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: semiBold)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              header(),
              SizedBox(height: 20),
              passwordField(),
              confirmPasswordField(),
              SizedBox(
                height: defaultMargin,
              ),
              resetButton(),
            ],
          ),
        ),
      ),
    );
  }
}
