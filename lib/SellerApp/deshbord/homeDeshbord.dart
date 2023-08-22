import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerp_toon/SellerApp/deshbord/productlistwidget.dart';
import 'package:peerp_toon/SellerApp/deshbord/sallerHistory/sellerproducthistory.dart';
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
        backgroundColor:
        themeFlag ? AppColors.mirage : AppColors.creamColor,
        iconTheme: IconThemeData(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage),
      ),
      drawer: Drawer(
        backgroundColor:
        themeFlag ? AppColors.mirage : AppColors.creamColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: themeFlag
                      ? AppColors.mirage
                      : AppColors.creamColor),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset("assets/images/logo/userIcon.png", height: 70,width: 70,),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "Govind lodhi",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontSize: 12, letterSpacing: 2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "govind@gmail.com",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 10, letterSpacing: 2),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
              title: const Text('Home'),
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
                color:
                themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
              title: const Text('Profile '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfile()));
              },
            ),
            ListTile(
              leading: Icon(EvaIcons.shoppingCart,
                  color: themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage),
              title: Text(
                'Product',
                style: TextStyle(
                    color: themeFlag
                        ? AppColors.creamColor
                        : AppColors.mirage),
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
                themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
              title: Text('Sale Product',
                  style: TextStyle(
                      color: themeFlag
                          ? AppColors.creamColor
                          : AppColors.mirage)),
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
                themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
              title: Text('Contact Us',
                  style: TextStyle(
                      color: themeFlag
                          ? AppColors.creamColor
                          : AppColors.mirage)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            width: double.infinity,

            decoration: BoxDecoration(
                color:Colors.green,
                // themeFlag ? AppColors.Con : AppColors.mirage,
                borderRadius: BorderRadius.circular(12)
            ),
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
                        fontSize: 20,
                      color:
                      themeFlag ? AppColors.white : AppColors.white,
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
                Text("IND 24,000",style: TextStyle(fontSize: 40, color:
                themeFlag ? AppColors.white : AppColors.white,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total :",style: TextStyle(fontSize: 25, color:
                    themeFlag ? AppColors.white : AppColors.white,),),
                    Text("15",style: TextStyle(fontSize: 25, color:
                    themeFlag ? AppColors.white : AppColors.white,),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddProdect()));
                      },
                      child: Container(width: 120,
                          height: 30,
                      decoration: BoxDecoration(
                        color:themeFlag? AppColors.rawSienna : AppColors.rawSienna,
                        borderRadius: BorderRadius.circular(12)
                      ),
                        child: Center(child: Text("ADD PRODUCT")),
                      ),
                    )
                  ],
                )
              ],),
            ),
          ),
              vSizedBox2,
              Text("Orders List ",style: TextStyle(fontSize: 20),),
              vSizedBox2,
              Container(
                width: double.infinity,
                height: 177,
                decoration: BoxDecoration(
                  color: AppColors.mediumPurple,
                  borderRadius: BorderRadius.circular(12)
                ),
                child:  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(

                            trailing: Column(
                              children: [
                                const Text(
                                  "1500",
                                  style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                                Container(
                                  width: 106,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: Color(0xffD7834F),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(child: Text("Order Accept ",style: TextStyle(color: Colors.white),),),
                                )
                              ],
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(" $index.  Vikrant bhawani"),
                                Text("Deharadun"),
                              ],
                            )),
                      );
                    }),


              ),
              vSizedBox2,
              Text("Product List",style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),
              SizedBox(
                width: double.infinity,
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ProductListWidget(
                      name: productList[index]['name'],
                      imageUrl: productList[index]['imageUrl'],
                      price: productList[index]['price'],
                    );
                  },
                ),
              ),

              vSizedBox2,




        ],
          ),
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