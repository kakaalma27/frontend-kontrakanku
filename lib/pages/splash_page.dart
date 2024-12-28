import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend_kontrakan/theme.dart';
import 'package:frontend_kontrakan/services/auth_services.dart'; // Import AuthServices
import 'package:frontend_kontrakan/providers/auth_provider.dart'; // Import AuthProvider
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Start the timer and check authentication after 3 seconds
    Timer(
      Duration(seconds: 3),
      _checkAuthentication,
    );
  }

  // Function to check if the user is authenticated and navigate accordingly
  void _checkAuthentication() async {
    final authServices = AuthServices();

    bool isAuthenticated = await authServices.isAuthenticated();

    if (isAuthenticated) {
      // Check the user's role after authentication
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      int? role = authProvider.user.role;

      // Navigate based on the role
      if (role == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (role == 1) {
        Navigator.pushReplacementNamed(context, '/home-admin');
      } else {
        Navigator.pushReplacementNamed(context, '/sign-in');
      }
    } else {
      // If the user is not authenticated, navigate to sign-in page
      Navigator.pushReplacementNamed(context, '/sign-in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Container(
          width: 190,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/homepage.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
