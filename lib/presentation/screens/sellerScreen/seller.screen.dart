import 'package:cache_manager/core/cache_manager_utils.dart';
import 'package:cache_manager/core/write_cache_service.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';

import 'package:provider/provider.dart';

import '../../../app/constants/app.colors.dart';
import '../../../app/constants/app.keys.dart';
import '../../../core/api/shopRegisterApi.dart';
import '../../../core/notifiers/authentication.notifer.dart';
import '../../../core/notifiers/theme.notifier.dart';
import '../../widgets/custom.animated.container.dart';
import '../../widgets/custom.text.field.dart';
import '../../widgets/dimensions.widget.dart';

import '../signUpScreen/widget/welcome.signup.widget.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({Key? key}) : super(key: key);

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

TextEditingController textcompanyName = TextEditingController();
TextEditingController textemailid = TextEditingController();
TextEditingController textphone = TextEditingController();
TextEditingController textgstnuber = TextEditingController();

TextEditingController shopname = TextEditingController();
TextEditingController textADDRESS = TextEditingController();

class _SellerScreenState extends State<SellerScreen> {
  OtpFieldController otpController = OtpFieldController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _userLogin() {
      if (_formKey.currentState!.validate()) {
        var authNotifier =
            Provider.of<AuthenticationNotifier>(context, listen: false);
        authNotifier.shopUserDetails(
          context: context,
          userEmail: textemailid.text.toString(),
          userAddress: textADDRESS.text.toString(),
          userPhoneNo: textphone.text.toString(),
          name: textcompanyName.text.toString(),
          GstnNo: textgstnuber.text.toString(),
          shopType: shopname.text.toString(),
        );
      }
    }

    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeSellerText(themeFlag: themeFlag),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                child: Container(
                  width: double.infinity,
                  height: 700,
                  decoration: BoxDecoration(
                      color: AppColors.mediumPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 30),
                                child: CustomTextField.customTextField(
                                    textEditingController: textcompanyName,
                                    hintText: ' Name',
                                    validator: (val) =>
                                        val!.isEmpty ? '  Name' : null),
                              ),
                              vSizedBox1,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: CustomTextField.customTextField(
                                  textEditingController: textemailid,
                                  hintText: 'EMAIL ID',
                                  validator: (val) => val!.isEmpty
                                      ? 'Enter an  EMAIL ID'
                                      : null,
                                ),
                              ),
                              vSizedBox1,
                              Padding(
                                padding:
                                       const EdgeInsets.only(left: 10, right: 10),
                                child: CustomTextField.customTextField(
                                    // onChanged: (val) {
                                    //   authNotifier(false)
                                    //       .checkPasswordStrength(password: val);
                                    // },
                                    textEditingController: textphone,
                                    hintText: 'Enter a Phone number',
                                    maxLength: 10,
                                    validator: (value) {
                                      String patttern =
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = new RegExp(patttern);
                                      if (value?.length == 0) {
                                        return 'Please enter mobile number';
                                      } else if (!regExp.hasMatch(value!)) {
                                        return 'Please enter valid mobile number';
                                      }
                                      return null;
                                    }

                                    // validateMobile(val!);
                                    // val!.isEmpty ? 'Enter a phone number' : null,
                                    ),
                              ),
                              vSizedBox1,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: CustomTextField.customTextField(
                                  // onChanged: (val) {
                                  //   authNotifier(false)
                                  //       .checkPasswordStrength(password: val);
                                  // },
                                  textEditingController: textgstnuber,
                                  hintText: 'GSTIN NO',
                                  validator: (val) => val!.isEmpty
                                      ? 'Enter your GSTIN NO'
                                      : null,
                                ),
                              ),
                              vSizedBox1,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: CustomTextField.customTextField(
                                  // onChanged: (val) {
                                  //   authNotifier(false)
                                  //       .checkPasswordStrength(password: val);
                                  // },
                                  textEditingController: shopname,
                                  hintText: 'SHOP TYPE',
                                  validator: (val) =>
                                      val!.isEmpty ? 'SHOP TYPE' : null,
                                ),
                              ),
                              vSizedBox1,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: CustomTextField.customTextField(
                                  // onChanged: (val) {
                                  //   authNotifier(false)
                                  //       .checkPasswordStrength(password: val);
                                  // },
                                  textEditingController: textADDRESS,
                                  hintText: 'ADDRESS',
                                  validator: (val) =>
                                      val!.isEmpty ? 'SHOP TYPE' : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                        vSizedBox3,
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 106,
                                height: 96,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              hSizedBox1,
                              Container(
                                width: 106,
                                height: 96,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 70,
                                ),
                              )
                            ],
                          ),
                        ),
                        vSizedBox4,
                        MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.05,
                          minWidth: MediaQuery.of(context).size.width * 0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () async {
                            print("Seller Screen");
                            _userLogin();
                            // _initiateCache();
                            /// shopUserDetails(userEmail: textemailid.text.toString(), userAddress: textADDRESS.text.toString(), userPhoneNo: textphone.text.toString(), name: textcompanyName.text.toString(), GstnNo: textgstnuber.text.toString(), shopType: shopname.text.toString());
                            //  Navigator.of(context).pushReplacementNamed(AppRouter.homedeshbordseller) ;
                          },
                          color: AppColors.rawSienna,
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
