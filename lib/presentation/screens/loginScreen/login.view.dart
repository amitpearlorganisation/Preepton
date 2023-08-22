import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:peerp_toon/presentation/screens/loginScreen/widget/welcome.login.widget.dart';



import 'package:provider/provider.dart';

import '../../../app/constants/app.colors.dart';
import '../../../app/routes/routes_imports.dart';
import '../../../core/notifiers/authentication.notifer.dart';
import '../../../core/notifiers/theme.notifier.dart';
import '../../widgets/custom.text.field.dart';
import '../../widgets/dimensions.widget.dart';
import '../homeScreen/home.screen.dart';

// bool isEmail(String input) => EmailValidator.validate(input);
//
// bool isPhone(String input) =>
//     RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
//         .hasMatch(input);

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // final TextEditingController userPhoneController = TextEditingController();
  final TextEditingController userEmailPhoneController =
      TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /*_userLogin() {
      if (_formKey.currentState!.validate()) {
        var authNotifier =
            Provider.of<AuthenticationNotifier>(context, listen: false);
        authNotifier.userLogin(
          context: context,
          useremail: userEmailPhoneController.text,
          userpassword: userPassController.text,
          // usercontact: userEmailPhoneController.text,
        );
      }
    }*/

    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeTextLogin(themeFlag: themeFlag),
              vSizedBox2,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                            child: CustomTextField.customTextField(
                              textEditingController: userEmailPhoneController,
                              hintText: 'Enter an email/number',
                              validator: (val) =>
                                  !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                          .hasMatch(val!)
                                      ? 'Enter an email/number'
                                      : null,
                            ),
                          ),
                          vSizedBox1,
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                            child: CustomTextField.customTextField(
                              textEditingController: userPassController,
                              hintText: 'Enter a password',
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter a password' : null,
                            ),
                          )
                        ],
                      ),
                    ),
                    vSizedBox2,
                    MaterialButton(
                      height: MediaQuery.of(context).size.height * 0.05,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () async {
                        // _userLogin();
                        if(userEmailPhoneController.text.isEmpty || userPassController.text.isEmpty){
                          showTopSnackBar(context);
                        }
                        else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        }
                      },
                      color: AppColors.rawSienna,
                      child: const Text(
                        'LOGIN',
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
              vSizedBox2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not Having A Account? ",
                    style: TextStyle(
                      color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontSize: 14.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRouter.signUpRoute),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
              vSizedBox2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password ? ",
                    style: TextStyle(
                      color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontSize: 14.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AppRouter.forgotPassword),
                    child: Text(
                      "Forgot",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void showTopSnackBar(BuildContext context)=>
    Flushbar(
      icon: Icon(
        Icons.error,
        size: 25,
      ),
      shouldIconPulse: true,
      title: "Error",
      message: "Please check your input fields",
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.all(10),
    )..show(context);