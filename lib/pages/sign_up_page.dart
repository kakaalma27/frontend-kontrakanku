import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/providers/auth_provider.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int? selectedValue = null;
  final List<Map<String, dynamic>> roleOptions = [
    {'value': 0, 'text': 'Pengguna'},
    {'value': 1, 'text': 'Pemilik'},
  ];

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passowrdController = TextEditingController(text: '');
  TextEditingController passwordconfirmationController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      if (selectedValue == null) {
        // Tampilkan pesan jika role belum dipilih
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pilih role terlebih dahulu')),
        );
        return;
      }

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passowrdController.text,
        password_confirmation: passwordconfirmationController.text,
        role: selectedValue!, // Kirim nilai role yang dipilih
      )) {
        // Gunakan selectedValue untuk memeriksa role
        if (selectedValue == 0) {
          Navigator.pushNamed(context, '/home');
        } else if (selectedValue == 1) {
          Navigator.pushNamed(context, '/home-admin');
        } else {
          // Tambahkan navigasi untuk role lain jika diperlukan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Role tidak dikenal')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pendaftaran gagal, periksa input Anda')),
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
              'Daftar',
              style: blackColorStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Daftar dan Cari Kontrakan',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget role() {
      return Container(
        margin: EdgeInsets.only(top: 16, bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Sebagai',
              style: blackColorStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<int>(
                value: selectedValue, // Nilai default akan null di awal
                isExpanded: true,
                underline: SizedBox(),
                hint: Text(
                  'Pilih Terlebih Dahulu',
                  style: subtitleTextStyle,
                ),
                style: subtitleTextStyle,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedValue = newValue; // Set nilai baru
                    print("Selected role: $selectedValue"); // Debugging
                  });
                },
                items: roleOptions.map((role) {
                  return DropdownMenuItem<int>(
                    value: role['value'],
                    child: Text(role['text']),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget fullnameinput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama lengkap',
              style: blackColorStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/rename-outline.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackColorStyle,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Nama Lengkap Anda',
                            hintStyle: subtitleTextStyle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameinput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Pengguna',
              style: blackColorStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/badge-account-outline.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackColorStyle,
                        controller: usernameController,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Nama Pengguna Anda',
                            hintStyle: subtitleTextStyle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailinput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Email',
              style: blackColorStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/email-outline.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackColorStyle,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                            hintText: 'contoh@gmail.com',
                            hintStyle: subtitleTextStyle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordinput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kata Sandi',
              style: blackColorStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/lock-outline.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackColorStyle,
                        controller: passowrdController,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Kata Sandi Anda',
                            hintStyle: subtitleTextStyle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordConfirmationinput() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Konfirmasi Kata Sandi',
              style: blackColorStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/lock-outline.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackColorStyle,
                        controller: passwordconfirmationController,
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Konfirmasi Kata Sandi Anda',
                            hintStyle: subtitleTextStyle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signbutton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            handleSignUp();
          },
          style: TextButton.styleFrom(
              backgroundColor: blackColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Daftar',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah Punya Akun? ',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Masuk',
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                fullnameinput(),
                usernameinput(),
                emailinput(),
                passwordinput(),
                passwordConfirmationinput(),
                role(),
                signbutton(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
