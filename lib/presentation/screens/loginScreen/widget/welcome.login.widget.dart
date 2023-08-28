import 'package:flutter/material.dart';

import '../../../../app/constants/app.colors.dart';
import '../../../../app/constants/app.fonts.dart';
import '../../../widgets/dimensions.widget.dart';

Widget welcomeTextLogin() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      vSizedBox1,
      Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome ',
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: "Libre",
                      letterSpacing: 1
                    ),
                  ),
                  TextSpan(
                    text: 'To ',
                    style: TextStyle(
                      color:Colors.white,

                      fontSize: 18.0,
                      fontFamily: "Libre",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  TextSpan(
                    text: 'Peeptoon ! 🛒',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 18.0,
                      fontFamily: "Libre",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 2.0),
      //   child: RichText(
      //     text: TextSpan(
      //       children: [
      //         TextSpan(
      //           children: [
      //             TextSpan(
      //               text: 'Log In To ',
      //               style: TextStyle(
      //                 color:Colors.white,
      //                 letterSpacing: 1,
      //                 fontFamily: "Libre",
      //                 fontWeight: FontWeight.w500,
      //                 fontSize: 14.0,
      //               ),
      //             ),
      //             TextSpan(
      //               text: 'Your ',
      //               style: TextStyle(
      //                 color:Colors.white,
      //                 letterSpacing: 1,
      //                 fontFamily: "Libre",
      //                 fontSize: 14.0,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             TextSpan(
      //               text: 'Account Right Now ! ',
      //               style: TextStyle(
      //                 color:Colors.white,
      //                 letterSpacing: 1,
      //                 fontFamily: "Libre",
      //                 fontSize: 14.0,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ],
  );
}
