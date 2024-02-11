import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/common_functions.dart';
import '../../../utils/colors.dart';

class ButtomAuthScreenWidget extends StatelessWidget {
  const ButtomAuthScreenWidget({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Column(children: [
      Container(
        height: 1,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [white,greyShade3,white],
          ),
        ),
      ),
      CommonFunction.blankSpace(height*0.02, 0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Condition of Use',
            style: textTheme.bodyMedium!.copyWith(
              color: blue,),),
          Text('Privacy Notice',
            style: textTheme.bodyMedium!.copyWith(
              color: blue,),),
          Text('Help',
            style: textTheme.bodyMedium!.copyWith(
              color: blue,),),
        ],
      ),
      CommonFunction.blankSpace(height*0.01, 0,),
      Text('© 1996-2024, Amazon.com, inc. or its affiliates',style: textTheme.labelSmall!.copyWith(color: grey),),
    ],
    );
  }
}