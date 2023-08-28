import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

// import 'package:namastethailand/login.dart';

// import '../Utility/logout.dart';
// import '../Utility/sharePrefrences.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "Govind@gmail.com");
  String name = '';
  String phoneNumber = '';
  late String _email;
   bool updateprofile = false;
  TextEditingController _nameController = TextEditingController(text: 'amit');
  TextEditingController _phoneController = TextEditingController(text: "8006429916");



  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _showUpdateDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () {
                // Update the data using the name and phone number fields
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  TextEditingController email_controller = TextEditingController();
  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.4,
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipPath(
                      clipper: BottomClipper(),
                      child: Container(
                        color: Colors.pinkAccent,
                        height: MediaQuery.of(context).size.height*0.35,
                      ),
                    )),
                Positioned(
                  left:0,
                  right: 0,
                  bottom: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(70))
                        ),
                        child: ClipOval(
                          child: Image.asset("assets/images/logo/userIcon.png",height: 150, width:150,),
                        )
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,


                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.arrow_back,color: Colors.white),

                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () async {
                      // await AuthLogout().logout();
                      // if (mounted) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const Login()),
                      //   );
                      // }
                    },
                    child: Container(
                      height: 30,
                      width: 30,


                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.logout,color: Colors.white),

                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  updateprofile?
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.pinkAccent
                    ),
                    color: Colors.white,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:60,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Icon(Icons.person,color: Colors.white,)),
                        SizedBox(width: 10,),
                        Expanded(child:
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none, // No underline
                              )
                          ),
                        )
                        )

                    ],
                    ),
                  ):
                  BlurryContainer(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFDCEDF),
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:55,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Icon(Icons.person,color: Colors.pinkAccent,)),
                        SizedBox(width: 10,),
                        Text("Amit",textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Libre",
                            letterSpacing: 1,
                            color: Colors.blue
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  updateprofile?
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.pinkAccent
                      ),
                      color: Colors.white,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:60,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Icon(Icons.email,color: Colors.white,)),
                        SizedBox(width: 10,),
                        Expanded(child:
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none, // No underline
                              )
                          ),
                        )
                        )

                      ],
                    ),
                  ):
                  BlurryContainer(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFDCEDF),
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:55,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Icon(Icons.email,color: Colors.pinkAccent,)),
                        SizedBox(width: 10,),
                        Text("amitpearl@gmail.com",textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Libre",
                            letterSpacing: 1,
                            color: Colors.blue
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  updateprofile?
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.pinkAccent
                      ),
                      color: Colors.white,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:60,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Icon(Icons.phone,color: Colors.white,)),
                        SizedBox(width: 10,),
                        Expanded(child:
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none, // No underline
                              )
                          ),
                        )
                        )

                      ],
                    ),
                  ):

                  BlurryContainer(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFDCEDF),
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height:55,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Icon(Icons.phone,color: Colors.pinkAccent,)),
                        SizedBox(width: 10,),
                        Text("979815555",textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Libre",
                            letterSpacing: 1,
                            color: Colors.blue
                        ),),
                      ],
                    ),
                  ),
                  vSizedBox2,
                  updateprofile?
                  InkWell(
                    onTap: (){
                      setState(() {
                        updateprofile=false;
                      });
                    },
                    child: BlurryContainer(
                      elevation: 3,
                      width: double.infinity,
                      height: 55,
                      color: Colors.pinkAccent,
                      child: Center(
                        child: Text("UPDATE",textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          fontFamily: "Libre"
                        ),),
                      ), ),
                  ):InkWell(
                    onTap: (){
                      setState(() {
                        updateprofile=true

                        ;
                      });
                    },
                    child: BlurryContainer(
                      elevation: 3,
                      width: double.infinity,
                      height: 55,
                      color: Colors.pinkAccent,
                      child: Center(
                        child: Text("Edit",textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontFamily: "Libre"
                        ),),
                      ), ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}