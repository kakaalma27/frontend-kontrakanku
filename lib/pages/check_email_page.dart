import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/pages/verif_code_page.dart';
import 'package:provider/provider.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';
import 'package:frontend_kontrakan/theme.dart';

class CheckEmailPage extends StatefulWidget {
  @override
  _CheckEmailPageState createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  final TextEditingController emailController = TextEditingController();

// Contoh di dalam CheckEmailPage
  void _checkEmail() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      bool success = await authProvider.checkEmail(email: emailController.text);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifCodePage(email: emailController.text),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Reset link sent to your email'),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  // Widget untuk header
  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lupa Password',
            style: blackColorStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Silakan masukkan email, untuk mengatur ulang Password.',
            style: subtitleTextStyle.copyWith(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  // Widget untuk input email
  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Email',
            style: blackColorStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
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
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol reset password
  Widget resetPassword() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: () => _checkEmail(),
        style: TextButton.styleFrom(
          backgroundColor: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Reset Password',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              resetPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
