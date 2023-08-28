import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otp Verification'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              padding: EdgeInsets.all(20),
              child: Image.asset("assets/images/logo/otp.png",fit: BoxFit.fill),
            ),
            Text("Email Verification", style: TextStyle(fontFamily: "Libre", letterSpacing: 1, fontSize: 12),),
            vSizedBox1,
            Text("Enter the code send to + email", style: TextStyle(fontFamily: "Libre", letterSpacing: 1, fontSize: 12),),

            vSizedBox3,
            PinCodeTextField(
              appContext: context,
              length: 4,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              keyboardType: TextInputType.number,
              animationType: AnimationType.scale,
              boxShadows: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },// Length of OTP
              onChanged: (value) {
                // Callback when OTP changes
              },
            ),
            SizedBox(height: 10),
            Text("Didn't receive the code? resend", style: TextStyle(color: Colors.blue),),
          ],
        ),
      ),
    );
  }
}