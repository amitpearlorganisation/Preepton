import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerp_toon/SellerApp/dashbord/productlistwidget.dart';
import 'package:peerp_toon/SellerApp/dashbord/sallerHistory/sellerproducthistory.dart';

import 'package:provider/provider.dart';

import '../../app/constants/app.colors.dart';
import '../../core/notifiers/theme.notifier.dart';
import '../../presentation/screens/cartScreen/cart.screen.dart';
import '../../presentation/screens/productScreen/product.screen.dart';
import '../../presentation/screens/profileScreens/mainProfileScreen/profile.screen.dart';
import '../../presentation/screens/sellerScreen/seller.screen.dart';
import '../../presentation/widgets/dimensions.widget.dart';
import 'addProduct.dart';
import 'contactus.dart';

class HomeDeshbordSeller extends StatefulWidget {
  const HomeDeshbordSeller({Key? key}) : super(key: key);

  @override
  State<HomeDeshbordSeller> createState() => _HomeDeshbordSellerState();
}

class _HomeDeshbordSellerState extends State<HomeDeshbordSeller> {
  // List<String> images = [
  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor:
      themeFlag ? AppColors.mirage : AppColors.creamColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.pinkAccent,
        iconTheme: IconThemeData(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage),
      ),
      drawer: Drawer(
        backgroundColor:Colors.pinkAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset("assets/images/logo/userIcon.png", height: 70,width: 70,),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Govind lodhi",
                    style:TextStyle(
                        color: Colors.white, fontSize: 12, letterSpacing: 1,fontFamily: "Libre" ),
                  ),
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
                            color: Colors.white, fontSize: 10, letterSpacing: 1,fontFamily: "Libre"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color:Colors.white,
              ),
              title: const Text('Home', style: TextStyle(fontFamily: ":Libre",color: Colors.white),),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductScreen()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                color:Colors.white,
              ),
              title: const Text('Profile ',style: TextStyle(fontFamily: ":Libre",color: Colors.white)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()));
              },
            ),
            ListTile(
              leading: Icon(EvaIcons.shoppingCart,
                  color:Colors.white),
              title: Text(
                'Product',
                  style: TextStyle(fontFamily: ":Libre",color: Colors.white)
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ProductHistory()));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.sell,
                color:
               Colors.white,
              ),
              title: Text('Sale Product',
                 style: TextStyle(fontFamily: ":Libre",color: Colors.white),),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SellerScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contacts,
                color:
               Colors.white,
              ),
              title: Text('Contact Us',
                  style: TextStyle(fontFamily: ":Libre",color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlurryContainer(

            width: double.infinity,
            color: Colors.white,
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shop Name",style: TextStyle(
                        fontSize: 16,
                      color:Colors.pinkAccent,
                      fontFamily: "Libre"
                    ),),
                    Container(
                        width: 50,
                        height: 50,

                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
                            )
                        )),
                  ],
                ),
                Text("IND 24,000",style: TextStyle(fontSize: 14, color:Colors.black, fontFamily: "Libre"),),
                Row(
                  children: [
                    Text("Total :",style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: "Libre"),),
                    Text("15",style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: "Libre",),),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddProdect()));
                          },
                          child: Container(width: 110,
                              height: 30,
                          decoration: BoxDecoration(
                            color:Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(20)
                          ),
                            child: Center(child: Text("ADD PRODUCT", style: TextStyle(fontFamily: "Libre", fontSize: 10, ),)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],),
            ),
        ),
          ),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Orders List ",style: TextStyle(fontSize: 14, fontFamily: "libre"),),
            ),
            vSizedBox2,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlurryContainer(
                width: double.infinity,
                height: 400,
                color: Colors.white,
                elevation: 0.1,
                child:  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.pinkAccent,
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: ListTile(





                            trailing:                                  Container(
                              width: 106,
                              height: 26,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Center(child: Text("Order Accept ",style: TextStyle(color: Colors.black,fontFamily: "Libre",fontSize: 11),),),
                            ),

                          // Column(
                          //     children: [
                          //       const Text(
                          //         "1500",
                          //         style: TextStyle(color: Colors.white, fontSize: 14),
                          //       ),
                          //     ],
                          //   )
                            title:    Text(" $index.  Vikrant bhawani", style: TextStyle(color: Colors.white,fontFamily: "Libre",fontSize: 11),),
                          subtitle: Text(
                            "1500",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                      );
                    }),


              ),
            ),
            // vSizedBox2,
            // Text("Product List",style: TextStyle(fontSize: 20),),
            // SizedBox(height: 5,),
            // SizedBox(
            //   width: double.infinity,
            //   height: 230,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: productList.length,
            //     itemBuilder: (context, index) {
            //       return ProductListWidget(
            //         name: productList[index]['name'],
            //         imageUrl: productList[index]['imageUrl'],
            //         price: productList[index]['price'],
            //       );
            //     },
            //   ),
            // ),

            // vSizedBox2,




      ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> productList = [
  {
    'name': 'Product 1',
    'imageUrl': 'assets/images/shoes/shoes3.jpg',
    'price': 9.99,
  },
  {
    'name': 'Product 2',
    'imageUrl': 'assets/images/shoes/shoes1.jpg',
    'price': 19.99,
  },
  {
    'name': 'Product 3',
    'imageUrl': 'assets/images/shoes/shoes2.jpg',
    'price': 29.99,
  },
];