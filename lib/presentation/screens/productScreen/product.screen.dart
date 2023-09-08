
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peerp_toon/presentation/screens/loginScreen/login.view.dart';
import 'package:peerp_toon/presentation/screens/productScreen/widgets/brands.widget.dart';

import '../../../SellerApp/dashbord/contactus.dart';
import '../../../core/api/user.api.dart';
import '../../widgets/dimensions.widget.dart';
import '../DeliveryAddress/userDiliveryAddress.dart';
import '../cartScreen/cart.screen.dart';
import '../myorderscreen/myorderscreen.dart';
import '../profileScreens/mainProfileScreen/profile.screen.dart';
import '../sellerScreen/registerSeller.dart';
import 'blog.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  void initState() {
    UserAPI.getUserUpdateDetaile();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor:Colors.pinkAccent,
            iconTheme: IconThemeData(
                color: Colors.white),
            actions: [
              Icon(Icons.shopping_bag),
              SizedBox(
                width: 20,
              )
            ],
          ),
          drawer: Drawer(
            backgroundColor:Color(0xffFDCEDF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                      color:Colors.pinkAccent),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset("assets/images/logo/userIcon.png", height: 70,width: 70,),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "Govind lodhi",
                        style: TextStyle(
                            color: Colors.white, fontSize: 12, letterSpacing: 1, wordSpacing: 1,
                          fontFamily: "Libre"
                        ),
                      ),
                      vSizedBox1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "govind@gmail.com",
                            style: TextStyle(
                                color: Colors.white, fontSize: 10, letterSpacing: 1,wordSpacing: 1,
                            fontFamily: "Libre"
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.pinkAccent),
                  title: const Text('Profile ', style: TextStyle(fontFamily: "Libre", fontSize: 14, color: Colors.pinkAccent,letterSpacing: 1),),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile()));
                  },
                ),
                ListTile(
                  leading: Icon(EvaIcons.shoppingCart,
                      color:Colors.pinkAccent),
                  title: Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                      fontFamily: "Libre",
                      letterSpacing: 1
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  AddToCart()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.note_alt_rounded,
                    color:Colors.pinkAccent,
                  ),
                  title: Text('Blog',
                      style: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: "Libre",
                      letterSpacing: 1
                  ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Blog()));                    },
                ),
                ListTile(
                  leading: Icon(
                    Icons.sell,
                    color: Colors.pinkAccent,
                  ),
                  title: Text('Become Seller',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: "Libre",
                        letterSpacing: 1
                    ),


                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SellerRegistration()),
                    );                      // _initiateCache();
                    // Navigator.of(context).pushReplacementNamed(AppRouter.sellerScreen);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.telegram,
                    color: Colors.pinkAccent,
                  ),
                  title: Text('Contact Us',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: "Libre",
                        letterSpacing: 1
                    ),

                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Contact()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_box,
                    color:Colors.pinkAccent
                  ),
                  title: Text('MyOrder',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: "Libre",
                        letterSpacing: 1
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  OrderTrackerScreen()));                    },
                ),

                ListTile(
                  leading: Icon(EvaIcons.logOut,
                      color:Colors.pinkAccent),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: "Libre",
                        letterSpacing: 1
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.place,
                    color:Colors.pinkAccent
                  ),
                  title: Text('Address',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: "Libre",
                        letterSpacing: 1
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  UserDeliverAddressScreen()));
                  },
                ),

              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 20),
                    width: double.infinity,
                    height: 400,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage("assets/images/fashion.jpg"),
                      fit: BoxFit.fill,
                    ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BrandWidget(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
