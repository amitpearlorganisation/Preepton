import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peerp_toon/presentation/screens/loginScreen/loginbloc/login_bloc.dart';
import 'package:peerp_toon/presentation/screens/loginScreen/widget/welcome.login.widget.dart';
import 'package:peerp_toon/presentation/screens/productScreen/product.screen.dart';

import '../../../app/routes/routes_imports.dart';
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
   TextEditingController userEmailPhoneController =
      TextEditingController();
   TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<LoginBloc, LoginInitial>(
        listener: (context, state) {
          // TODO: implement listener
          if(state.status==Status.loading ){
            EasyLoading.show();
          }
          if(state.status == Status.success){
            EasyLoading.dismiss();
            EasyLoading.showSuccess("Successfully done ", duration: Duration(seconds: 3),);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));

          }
          if(state.status == Status.failed){
            EasyLoading.dismiss();
            EasyLoading.showError("Error", duration: Duration(seconds: 3));
          }
        },
        builder: (context, state) {
          if (state.status == Status.loading) {
            EasyLoading.show(status: 'Loading...');
          }
          return


            Scaffold(
              resizeToAvoidBottomInset: false,

              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xfF58B54).withOpacity(0.7), // Light orange
                        Colors.pinkAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Container(
                            height: 150,
                            width: 150,
                            padding: EdgeInsets.zero,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: SvgPicture.asset(
                                    'assets/images/blob.svg',
                                    // Replace with your SVG image path
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Libre",
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: BlurryContainer(
                          color: Color(0xfFFF8eA9).withOpacity(0.9),
                          elevation: 0.9,
                          blur: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              welcomeTextLogin(),
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  15.0, 0.0, 15.0, 2.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.pinkAccent,
                                                  // Transparent background
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  // Rounded corners
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    // White border color
                                                    width: 1, // Border width
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 58,
                                                      width: 58,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                        // Transparent background
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            30), // Rounded corners
                                                      ),
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.pinkAccent,
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: TextFormField(
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                          controller:
                                                          userEmailPhoneController,
                                                          decoration: InputDecoration(
                                                              hintText:
                                                              "Enter an email",
                                                              hintStyle: TextStyle(
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontFamily: "Libre",
                                                                  fontSize: 14),
                                                              border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide
                                                                      .none)),
                                                        ))
                                                  ],
                                                ),
                                              )
                                          ),
                                          vSizedBox1,
                                          Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  15.0, 0.0, 15.0, 2.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.pinkAccent,
                                                  // Transparent background
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  // Rounded corners
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                    // White border color
                                                    width: 1, // Border width
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 58,
                                                      width: 58,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                        // Transparent background
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            30), // Rounded corners
                                                      ),
                                                      child: Icon(
                                                        Icons.lock,
                                                        color: Colors.pinkAccent,
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: TextFormField(
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                          controller:
                                                          userPassController,
                                                          decoration: InputDecoration(
                                                              hintText:
                                                              "Enter your password",
                                                              hintStyle: TextStyle(
                                                                  color: Colors.white,
                                                                  letterSpacing: 1,
                                                                  fontFamily: "Libre",
                                                                  fontSize: 14),
                                                              border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                  BorderSide
                                                                      .none)),
                                                        ))
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    vSizedBox2,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: MaterialButton(
                                        height: 55,
                                        minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        onPressed: () async {
                                          // _userLogin();
                                          bloc.add(LoginUIEvent(email: userEmailPhoneController.text.trim(), password: userPassController.text.trim()));
                                        },
                                        color: Colors.white.withOpacity(0.87),
                                        child: const Text(
                                          'LOGIN',
                                          style: TextStyle(
                                            color: Colors.pinkAccent,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              vSizedBox3,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Not Having A Account? ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Libre",
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRouter.signUpRoute),
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.greenAccent,
                                          fontFamily: "Libre",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
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
                                      color: Colors.white,
                                      fontFamily: "Libre",
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRouter.forgotPassword),
                                    child: Text(
                                      "Forgot",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontFamily: "Libre",
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              vSizedBox2
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}

void showTopSnackBar(BuildContext context) => Flushbar(
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
