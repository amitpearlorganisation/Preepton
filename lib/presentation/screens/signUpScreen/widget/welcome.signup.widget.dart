import 'package:flutter/material.dart';

import '../../../../app/constants/app.colors.dart';
import '../../../../app/constants/app.fonts.dart';
import '../../../widgets/custom.text.style.dart';
import '../../../widgets/dimensions.widget.dart';

Widget welcomeTextSignup({required bool themeFlag}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      vSizedBox4,
      vSizedBox1,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            text: 'Hey There 😲',
            style: TextStyle(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              fontWeight: FontWeight.w900,
              fontFamily: AppFonts.contax,
              fontSize: 35.0,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome To ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontFamily: AppFonts.contax,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Peeptoon ! 🛒 ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontFamily: AppFonts.contax,
                      fontSize: 28.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: "Signup ",
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                  TextSpan(
                    text: "& Buy Shoes At Rock Bottom Prices",
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
    ],
  );
}

Widget welcomeSellerText({required bool themeFlag}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      vSizedBox4,
      vSizedBox1,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            text: 'Sell 😲',
            style: TextStyle(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              fontWeight: FontWeight.w900,
              fontFamily: AppFonts.contax,
              fontSize: 35.0,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Your Product ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontFamily: AppFonts.contax,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'on Peeptoon ! 🛒💰 ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontFamily: AppFonts.contax,
                      fontSize: 28.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: "Add Products ",
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                  TextSpan(
                    text: "Sell Your Product Here",
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
    ],
  );
}
