part of 'signup_imports.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userEmailController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController userPassController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  String selectedGender = "";

  final _formKey = GlobalKey<FormState>();
  bool _isNotificationEnabled = false;

  void _toggleNotification(bool value) {
    setState(() {
      _isNotificationEnabled = value;
    });

    // TODO: Implement logic to send notifications here
  }

  bool _acceptPrivacyPolicy = false;

  void _togglePrivacyPolicy(bool value) {
    setState(() {
      _acceptPrivacyPolicy = value;
    });
  }

  SignUpBloc signUpBloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signUpBloc,
      child: BlocConsumer<SignUpBloc, SignUpInitial>(
        listener: (context, state) {
          if (state.status == Status.loading) {
            EasyLoading.show();
          }
          if (state.status == Status.success) {
            EasyLoading.showSuccess("SignUp Successfully done");
          }
          if (state.status == Status.failed) {
            EasyLoading.showError("SignUp failed");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              // resizeToAvoidBottomInset: false,
              body: Container(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vSizedBox2,
                      BlurryContainer(
                          height: 70,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          color: Colors.pinkAccent.withOpacity(0.8),
                          blur: 10,
                          elevation: 1,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                    fontFamily: "Libre",
                                    fontSize: 16,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w500),
                              ))),
                      vSizedBox2,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 10.0, 35.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        // Transparent background
                                        borderRadius: BorderRadius.circular(30),
                                        // Rounded corners
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.9),
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
                                              color:
                                                  Colors.white.withOpacity(0.9),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: userNameController,
                                            decoration: InputDecoration(
                                                hintText: "Enter user name",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                    fontFamily: "Libre",
                                                    fontSize: 14),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none)),
                                          ))
                                        ],
                                      ),
                                    )

                                    // CustomTextField.customTextField(
                                    //     textEditingController: userNameController,
                                    //     hintText: 'Enter User Name',
                                    //     validator: (val) =>
                                    //         val!.isEmpty ? 'Enter an Username' : null),
                                    ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 10.0, 35.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        // Transparent background
                                        borderRadius: BorderRadius.circular(30),
                                        // Rounded corners
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.9),
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
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              // Transparent background
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      30), // Rounded corners
                                            ),
                                            child: Icon(
                                              Icons.email,
                                              color: Colors.pinkAccent,
                                            ),
                                          ),
                                          Expanded(
                                              child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: userEmailController,
                                            decoration: InputDecoration(
                                                hintText: "Enter an email",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                    fontFamily: "Libre",
                                                    fontSize: 14),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none)),
                                          ))
                                        ],
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 10.0, 35.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        // Transparent background
                                        borderRadius: BorderRadius.circular(30),
                                        // Rounded corners
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.9),
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
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              // Transparent background
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      30), // Rounded corners
                                            ),
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.pinkAccent,
                                            ),
                                          ),
                                          Expanded(
                                              child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: phoneNumberController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Enter an phone number",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                    fontFamily: "Libre",
                                                    fontSize: 14),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none)),
                                          ))
                                        ],
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 10.0, 35.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        // Transparent background
                                        borderRadius: BorderRadius.circular(30),
                                        // Rounded corners
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.9),
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
                                              color:
                                                  Colors.white.withOpacity(0.9),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: userPassController,
                                            decoration: InputDecoration(
                                                hintText: " password",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                    fontFamily: "Libre",
                                                    fontSize: 14),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none)),
                                          ))
                                        ],
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        35.0, 10.0, 35.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        // Transparent background
                                        borderRadius: BorderRadius.circular(30),
                                        // Rounded corners
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.9),
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
                                              color:
                                                  Colors.white.withOpacity(0.9),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller:
                                                confirmPasswordController,
                                            decoration: InputDecoration(
                                                hintText: "Confirm password",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                    fontFamily: "Libre",
                                                    fontSize: 14),
                                                border: OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide.none)),
                                          ))
                                        ],
                                      ),
                                    )),
                                vSizedBox1,
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      35.0, 10.0, 35.0, 2.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Choose Gender',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Libre",
                                            color: Colors.white),
                                      ),
                                      vSizedBox1,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: _buildGenderOption(
                                                  'Male', 'male')),
                                          Expanded(
                                              child: _buildGenderOption(
                                                  'Female', 'female')),
                                          Expanded(
                                              child: _buildGenderOption(
                                                  'Others', 'others')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      35.0, 10.0, 35.0, 2.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Enable to send notification",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Libre",
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Switch(
                                          activeTrackColor: Colors.white,
                                          activeColor: Colors.pink,
                                          value: _isNotificationEnabled,
                                          onChanged: _toggleNotification)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      35.0, 10.0, 35.0, 2.0),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: Colors.white,
                                        checkColor: Colors.pinkAccent,
                                        value: _acceptPrivacyPolicy,
                                        onChanged: (value) {
                                          setState(() {
                                            _acceptPrivacyPolicy = value!;
                                            print("Checkboxvlue------>$value");
                                            // signUpBloc.add(CheckBox(privacyPolicy: value));
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Accept privacy policy ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Libre",
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          vSizedBox2,
                          _acceptPrivacyPolicy
                              ? MaterialButton(
                                  height: 55,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  onPressed: () async {
                                    print("Selected gender-----> $selectedGender");
                                    signUpBloc.add(SingupTextInputEvent(
                                      name: userNameController.text.trim(),
                                      email: userEmailController.text.trim(),
                                      phone: phoneNumberController.text.trim(),
                                      password: userPassController.text.trim(),
                                      confirmPassword:
                                          confirmPasswordController.text.trim(),
                                      Gender: selectedGender,
                                      notifaction: _isNotificationEnabled,
                                      privacypolicy: _acceptPrivacyPolicy,
                                    ));
                                  },
                                  color: Colors.white.withOpacity(0.9),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: "Libre",
                                      letterSpacing: 1,
                                      color: Colors.pinkAccent,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      vSizedBox2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          BlurryContainer(
                            color: Color(0xfFFF8eA9).withOpacity(0.9),
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.9,
                            elevation: 1,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already Having A Account? ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      wordSpacing: 1,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Libre"),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(AppRouter.loginRoute),
                                  child: Text(
                                    "Login now",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.purple,
                                        fontFamily: "Libre",
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      vSizedBox4
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenderOption(String title, String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = value;
          print("Selected gender-----> $selectedGender");

        });
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedGender == value ? Colors.white : Colors.white,
            ),
            child: Center(
              child: selectedGender == value
                  ? Icon(
                      Icons.circle,
                      size: 14,
                      color: Colors.blue,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: "Libre",
            ),
          ),
        ],
      ),
    );
  }
}

void showTopSnackBar({required BuildContext context, required String msg}) =>
    Flushbar(
      icon: Icon(
        Icons.error,
        size: 25,
      ),
      shouldIconPulse: true,
      title: "Error",
      message: msg,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.all(10),
    )..show(context);
