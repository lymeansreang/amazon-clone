import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/auth_screen/widget/btnContinue.dart';
import 'package:amazon/view/auth_screen/widget/buttomAuthScreenWidget.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.mobileNumber});
  String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage(
              'assets/images/amazon_logo.png'),
          height: height * 0.19,
        ),
      ),
      body: SafeArea(
        child: Container(
        height: height,
        width: width,
          padding: EdgeInsets.symmetric(
          horizontal: width*0.03,
          vertical: height*0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Authentication Required',
                  style: textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w600),
                ),
                CommonFunction.blankSpace(height*0.01, 0),
                Text('${widget.mobileNumber}'),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                      text: '+85512345678',
                      style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' Change',
                        style: textTheme.bodyMedium,
                      )
                    ],
                    ),
                ),
                CommonFunction.blankSpace(height*0.01, 0),
                Text('We have sent a One Time Password (OTP) to the mobile number above. Please enter it to complete verification',
                style: textTheme.bodyMedium,
                ),
                CommonFunction.blankSpace(height*0.01, 0),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle: textTheme.bodySmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: grey
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: secondaryColor
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: grey
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: grey
                      ),
                    ),
                  ),
                ),
                CommonFunction.blankSpace(height*0.01, 0),
                CommonAuthButton(title: 'Continue',btnwidth: 0.94 ,onPressed: (){},),
                CommonFunction.blankSpace(height*0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child: Text('Resend OTP',style: textTheme.bodyMedium!.copyWith(color: blue),),),
                  ],
                ),
                CommonFunction.blankSpace(height*0.01, 0),
                ButtomAuthScreenWidget(),
              ],
            )
          ),
        ),
      ),
    );
  }
}
