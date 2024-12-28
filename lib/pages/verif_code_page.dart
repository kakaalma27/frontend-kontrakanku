import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_kontrakan/pages/new_password_page.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/services/auth_services.dart';

class VerifCodePage extends StatefulWidget {
  final String email;

  VerifCodePage({required this.email});

  @override
  _VerifCodePageState createState() => _VerifCodePageState();
}

class _VerifCodePageState extends State<VerifCodePage> {
  List<TextEditingController> otpControllers =
      List.generate(5, (index) => TextEditingController());
  bool isLoading = false;

  void verifyCode() async {
    String otpCode = otpControllers.map((controller) => controller.text).join();

    if (otpCode.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kode OTP harus 5 digit')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      bool success = await AuthServices().verifyToken(
        email: widget.email,
        token: otpCode,
      );

      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPasswordPage(
              email: widget.email,
              token: otpCode,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kode verifikasi salah')),
        );
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
              'Periksa Alamat Email',
              style: blackColorStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Masukkan kode 5 digit yang dikirim ke ${widget.email}',
              style: subtitleTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      );
    }

    Widget inputOtp() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => Container(
            margin: EdgeInsets.only(top: 70),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: bgColor2,
            ),
            child: TextFormField(
              controller: otpControllers[index],
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 4) {
                  FocusScope.of(context)
                      .nextFocus(); // Pindah ke input berikutnya
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context)
                      .previousFocus(); // Kembali ke input sebelumnya
                }
              },
            ),
          ),
        ),
      );
    }

    Widget verifyButton() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: isLoading ? null : verifyCode,
          style: TextButton.styleFrom(
            backgroundColor: blackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  'Verifikasi Kode',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              header(),
              inputOtp(),
              verifyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
