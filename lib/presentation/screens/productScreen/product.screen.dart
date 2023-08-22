import 'package:cache_manager/core/cache_manager_utils.dart';
import 'package:cache_manager/core/write_cache_service.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peerp_toon/presentation/screens/loginScreen/login.view.dart';
import 'package:peerp_toon/presentation/screens/productScreen/widgets/brands.widget.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../SellerApp/deshbord/contactus.dart';
import '../../../app/constants/ProductAPi.dart';
import '../../../app/constants/app.assets.dart';
import '../../../app/constants/app.colors.dart';
import '../../../app/constants/app.keys.dart';
import '../../../app/routes/routes_imports.dart';
import '../../../core/api/user.api.dart';
import '../../../core/notifiers/product.notifier.dart';
import '../../../core/notifiers/theme.notifier.dart';
import '../../widgets/custom.text.style.dart';
import '../../widgets/dimensions.widget.dart';
import '../../widgets/shimmer.effects.dart';
import '../DeliveryAddress/userDiliveryAddress.dart';
import '../cartScreen/cart.screen.dart';
import '../myorderscreen/myorderscreen.dart';
import '../productDetailScreen/product.detail.screen.dart';
import '../profileScreens/mainProfileScreen/profile.screen.dart';
import 'package:badges/badges.dart' as badges;

import '../sellerScreen/registerSeller.dart';
import 'blog.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String token = AppKeys.userData;

  void getInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString(AppKeys.userData)!;
    });
  }

  void initState() {
    getInfo();
    UserAPI.getUserUpdateDetaile();
    super.initState();
  }

  Future _initiateCache() async {
    return CacheManagerUtils.conditionalCache(
      key: AppKeys.onBoardDone,
      valueType: ValueType.StringValue,
      actionIfNull: () {
        Navigator.of(context)
            .pushNamed(AppRouter.homedeshbordseller)
            .whenComplete(() => {
                  WriteCache.setString(
                      key: AppKeys.onBoardDone, value: 'Something')
                });
      },
      actionIfNotNull: () {
        CacheManagerUtils.conditionalCache(
            key: AppKeys.userData,
            valueType: ValueType.StringValue,
            actionIfNull: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRouter.homedeshbordseller);
            },
            actionIfNotNull: () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRouter.homedeshbordseller);
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;

    return SafeArea(
        child: Scaffold(
            backgroundColor:
                themeFlag ? AppColors.mirage : AppColors.creamColor,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor:
                  themeFlag ? AppColors.mirage : AppColors.creamColor,
              iconTheme: IconThemeData(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage),
              actions: [
                Icon(Icons.shopping_bag),
                SizedBox(
                  width: 20,
                )
              ],
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
                      'Cart',
                      style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage),
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
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                    title: Text('Blog',
                        style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Blog()));                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.sell,
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                    title: Text('Become Seller',
                        style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage)),
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
                          MaterialPageRoute(
                              builder: (context) =>  Contact()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add_box,
                      color:
                      themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                    title: Text('MyOrder',
                        style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  OrderTrackerScreen()));                    },
                  ),

                  ListTile(
                    leading: Icon(EvaIcons.logOut,
                        color: themeFlag
                            ? AppColors.creamColor
                            : AppColors.mirage),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage),
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
                      color:
                      themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                    title: Text('Address',
                        style: TextStyle(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage)),
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
                      height: 536,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            "Fashion\nsale",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 48, color: Colors.white),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              width: 160,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Check",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          )
                        ],
                      ),
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                        image: new AssetImage("assets/images/bigbanner.png"),
                        fit: BoxFit.fill,
                      ))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BrandWidget(),
/*
                            SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Consumer<ProductNotifier>(
                                builder: (context, notifier, _) {
                                  return FutureBuilder(
                                    future: ProductApi.productList(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return ShimmerEffects.loadShimmer(
                                            context: context);
                                      } else if (!snapshot.hasData) {
                                        return Center(
                                          child: Text(
                                            'Some Error Occurred...',
                                            style:
                                                CustomTextWidget.bodyTextUltra(
                                              color: themeFlag
                                                  ? AppColors.creamColor
                                                  : AppColors.mirage,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return ListView.builder(
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              snapshot.data!.products!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                  AppRouter.prodDetailRoute,
                                                  arguments: ProductDetailsArgs(
                                                      id: snapshot.data!
                                                          .products![index].id
                                                          .toString()),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: BorderSide(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  elevation: 6,
                                                  color: themeFlag
                                                      ? AppColors.mirage
                                                      : AppColors.creamColor,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Hero(
                                                        tag: Key(snapshot.data!
                                                            .products![index].id
                                                            .toString()),
                                                        child: SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.165,
                                                          child: Image.network(
                                                            snapshot
                                                                .data!
                                                                .products![
                                                                    index]
                                                                .productImage
                                                                .toString(),
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
                                                      ),
                                                      vSizedBox1,
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            8, 8, 8, 8),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .products![
                                                                      index]
                                                                  .productName
                                                                  .toString(),
                                                              style:
                                                                  CustomTextWidget
                                                                      .bodyText3(
                                                                color: themeFlag
                                                                    ? AppColors
                                                                        .creamColor
                                                                    : AppColors
                                                                        .mirage,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            Text(
                                                              '₹  ${snapshot.data!.products![index].price.toString()}',
                                                              style:
                                                                  CustomTextWidget
                                                                      .bodyText3(
                                                                color: themeFlag
                                                                    ? AppColors
                                                                        .creamColor
                                                                    : AppColors
                                                                        .mirage,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            )
*/
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
