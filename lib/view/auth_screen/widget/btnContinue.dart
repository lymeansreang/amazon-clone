
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CommonAuthButton extends StatelessWidget {
  CommonAuthButton({
    super.key,required this .title, required this.onPressed,required this.btnwidth,
  });
  String title;
  VoidCallback onPressed;
  double btnwidth;

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: (){},
      style:ElevatedButton.styleFrom(
        minimumSize: Size(
          width*btnwidth,
          height*0.06,
        ),backgroundColor: amber,
      ),
      child: Text('Continue',
        style: textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
