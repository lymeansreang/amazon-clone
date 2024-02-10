import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/view/auth_screen/widget/buttomAuthScreenWidget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/utils/theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool inLogin = true;
  String currentCountryCode = '+855'; //value of country codes
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage(
            'assets/images/amazon_logo.png'),
          height: height * 0.19,
        ),
      ),
      body: SafeArea(child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: width*0.03,
            vertical: height*0.02
        ),child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome',
              style: textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600),
            ),
            CommonFunction.blankSpace(
              height*0.02, 0,
            ),
            // SignIn(width, height, textTheme, context),
            // CreateAccount(width, height, textTheme, context),
            Builder(builder: (context){
              if(inLogin){
                return SignIn(width, height, textTheme, context);
              }
              return CreateAccount(width, height, textTheme, context);
            }),
            CommonFunction.blankSpace(height*0.05, 0),
            ButtomAuthScreenWidget(width: width, height: height, textTheme: textTheme),
          ],
                ),
        ),
        ),
      ),
    );
  }

  Container SignIn(double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: greyShade3,),),
          child: Column(
            children: [
              Container(
                height: height*0.06,
                width: width,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: greyShade3
                        ),
                    ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: width*0.03),
              child: Row(
                children: [
                  InkWell(
                    onTap:(){
                      setState(() {
                        inLogin = false;
                      });
                  },
                    child: Container(
                      height: height*0.03,
                      width: height*0.03,
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                        border: Border.all(color: grey),
                        color: white,
                      ),

                      alignment: Alignment.center,
                      child: Icon(
                      Icons.circle,
                      size: height*0.015,
                      color: !inLogin ? secondaryColor: transparent,
                      ),
                    ),
                  ),CommonFunction.blankSpace(0, width*0.02,),
                  RichText(text: TextSpan(children: [
                    TextSpan(text: 'Create Account.',
                    style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold)),
                    TextSpan(text: ' New To Amazon?',
                    style: textTheme.bodyMedium)
                  ]))
                ],
              ),
            ),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: width*0.03,
                    vertical: height*0.01
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              inLogin = true;
                            });
                          },
                          child: Container(
                            height: height*0.03,
                            width: height*0.03,
                            decoration: BoxDecoration(
                              shape:BoxShape.circle,
                              border: Border.all(color: grey),
                              color: white,
                            ),

                            alignment: Alignment.center,
                            child: Icon(
                              Icons.circle,
                              size: height*0.015,
                              color: inLogin ? secondaryColor: transparent,
                            ),
                          ),
                        ),CommonFunction.blankSpace(0, width*0.02,),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: 'Sign in.',
                              style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: ' Already a Customer',
                              style: textTheme.bodyMedium)
                        ],),
                        ),
                      ],
                    ),
                    CommonFunction.blankSpace(
                        height*0.01, 0
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            showCountryPicker(
                                context: context,
                                onSelect: (val){
                                  setState(() {
                                    currentCountryCode = '+${val.phoneCode}';
                                  });
                            });
                          },
                          child: Container(
                            height: height*0.06,
                            width: width*0.2,
                            alignment: Alignment.center, //set the country code to the center of the container
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: grey),
                              color: greyShade2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              currentCountryCode,
                                style: textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.w600,),
                            ),
                          ),
                        ),SizedBox(
                          height: height*0.06,
                          width: width*0.64,
                          child: TextFormField(
                            //call the controller
                            controller: mobileController,
                            cursorColor: black,
                            style: textTheme.displaySmall,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Mobile number',
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
                        ),
                      ],
                    ),
                    CommonFunction.blankSpace(
                        height*0.02, 0),
                    ElevatedButton(
                        onPressed: (){},
                        style:ElevatedButton.styleFrom(
                            minimumSize: Size(
                                width*0.80,
                                height*0.06,
                            ),backgroundColor: amber,
                        ),
                        child: Text('Continue',
                      style: textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w600),
                        ),
                    ),
                    CommonFunction.blankSpace(height*0.02, 0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                          text: 'By Continuing you agree to Amazon\'s ',
                          style: textTheme.labelMedium,
                          ),
                          TextSpan(
                          text: 'Condition of use ',
                          style: textTheme.labelMedium!.copyWith(color: blue),
                          ),TextSpan(
                          text: 'and ',
                          style: textTheme.labelMedium,
                          ),TextSpan(
                          text: 'Privacy Notice ',
                          style: textTheme.labelMedium!.copyWith(color: blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
  Container CreateAccount(double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: greyShade3,),),
      child: Column(
        children: [

          Container(
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width*0.03,
                vertical: height*0.01
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: height*0.03,
                        width: height*0.03,
                        decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          border: Border.all(color: grey),
                          color: white,
                        ),

                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height*0.015,
                          color: !inLogin ? secondaryColor: transparent,
                        ),
                      ),
                    ),CommonFunction.blankSpace(0, width*0.02,),
                    RichText(text: TextSpan(children: [
                      TextSpan(text: 'Create Account.',
                          style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: ' New to Amazon?',
                          style: textTheme.bodyMedium)
                    ],),
                    ),
                  ],
                ),
                CommonFunction.blankSpace(
                    height*0.01, 0
                ),
                SizedBox(
                  height: height*0.06,

                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'First and Last name',
                      hintStyle: textTheme.bodySmall,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: grey,
                          ),
                        ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: secondaryColor,
                        )
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        )
                      ),
                    ),
                  ),
                ),
                CommonFunction.blankSpace(height*0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        showCountryPicker(
                            context: context,
                            onSelect: (val){
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        height: height*0.06,
                        width: width*0.2,
                        alignment: Alignment.center, //set the country code to the center of the container
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: grey),
                          color: greyShade2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ),SizedBox(
                      height: height*0.06,
                      width: width*0.64,
                      child: TextFormField(
                        //call the controller
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
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
                    ),
                  ],
                ),
                CommonFunction.blankSpace(
                    height*0.02, 0),
                Text('By enrolling your mobile phone number, you concent to receive automated security notifications via text message from Amazon.\nMessage and data rates may apply.',
                style: textTheme.bodyMedium,
                ),
                CommonFunction.blankSpace(height*0.02, 0,),
                ElevatedButton(
                  onPressed: (){},
                  style:ElevatedButton.styleFrom(
                    minimumSize: Size(
                      width*0.80,
                      height*0.06,
                    ),backgroundColor: amber,
                  ),
                  child: Text('Continue',
                    style: textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w600),
                  ),
                ),
                CommonFunction.blankSpace(height*0.02, 0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing you agree to Amazon\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Condition of use ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),TextSpan(
                        text: 'Privacy Notice ',
                        style: textTheme.labelMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height*0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: greyShade3
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width*0.03),
            child: Row(
              children: [
                InkWell(
                  onTap:(){
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height*0.03,
                    width: height*0.03,
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      border: Border.all(color: grey),
                      color: white,
                    ),

                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height*0.015,
                      color: inLogin ? secondaryColor: transparent,
                    ),
                  ),
                ),CommonFunction.blankSpace(0, width*0.02,),
                RichText(text: TextSpan(children: [
                  TextSpan(text: 'Sign In',
                      style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: ' Already a customer?',
                      style: textTheme.bodyMedium)
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}


