import 'package:amazon/utils/theme.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // home: AuthScreen(),
      home: OTPScreen(mobileNumber: '+85512345678'),
      theme: myTheme,
      //remove the debug banner on the corner
      debugShowCheckedModeBanner: false,
    );
  }
}