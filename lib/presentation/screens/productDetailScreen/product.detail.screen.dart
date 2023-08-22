import 'dart:math';

import 'package:flutter/material.dart';
import 'package:peerp_toon/presentation/screens/productDetailScreen/widget/select.size.dart';


import 'package:provider/provider.dart';

import '../../../app/constants/app.assets.dart';
import '../../../app/constants/app.colors.dart';
import '../../../core/api/prodectViweApi.dart';
import '../../../core/models/ProductViweListModel.dart';
import '../../../core/models/productID.model.dart';
import '../../../core/notifiers/product.notifier.dart';
import '../../../core/notifiers/theme.notifier.dart';
import '../../../core/utils/snackbar.util.dart';
import '../../widgets/custom.loader.dart';
import '../../widgets/custom.text.style.dart';
import '../../widgets/dimensions.widget.dart';
import '../cartScreen/cart.page.dart';

class ProductDetail extends StatefulWidget {
  final ProductDetailsArgs productDetailsArguements;

  const ProductDetail({
    Key? key,
    required this.productDetailsArguements,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400),
        title: Text("Product"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FutureBuilder(
            future: ProdectAPI.Prodectlist(
              id: widget.productDetailsArguements.id.toString(),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: customLoader(
                      context: context,
                      themeFlag: themeFlag,
                      lottieAsset: AppAssets.onBoardingOne,
                      text: 'Please Wait Till It Loads'),
                );
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 29),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          vSizedBox2,
/*
                          Hero(
                            tag: Key(snapshot.data!.product!.id.toString()),
                            child:
                            Image.network(
                              snapshot.data!.product!.productImage.toString(),
                              width: 300,
                              height: 300,
                              fit: BoxFit.fill,
                            ),
                          ),
*/
                          vSizedBox2,
                          Row(
                            children: [
/*
                              Expanded(
                                child: Text(
                                  snapshot.data!.product!.productName
                                      .toString(),
                                  style: CustomTextWidget.bodyTextB1(
                                    color: themeFlag
                                        ? AppColors.creamColor
                                        : AppColors.mirage,
                                  ),
                                ),
                              ),
*/
                              // Container(
                              //   padding: EdgeInsets.all(5),
                              //   decoration: BoxDecoration(
                              //       color: Colors.red,
                              //       borderRadius: BorderRadius.circular(8)),
                              //   child: Text(
                              //     '₹ ${snapshot.data!.product!.price.toString()}',
                              //     style: CustomTextWidget.bodyTextUltra(
                              //       color: themeFlag
                              //           ? AppColors.creamColor
                              //           : AppColors.white,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
/*
                          Text(
                            snapshot.data!.product!.description.toString(),
                            style: CustomTextWidget.bodyText3(
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                            textAlign: TextAlign.justify,
                          ),
*/
                        ],
                      ),
                      vSizedBox2,
                      Text(
                        'Choose Size',
                        style: CustomTextWidget.bodyTextB4(
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                        ),
                      ),
                      vSizedBox2,
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child:
                            selectSize(context: context, themeFlag: themeFlag),
                      ),
                      Row(
                        children: [
                          // for(int index =0;
                          // index<min(4,snapshot.data!.product!.productImage as num);
                          // index++
                          // )
/*
                            Container(
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                borderRadius: BorderRadius.circular(8)

                              ),
                              child: Image.network(snapshot.data!.product!.productImage.toString()),
                            )
*/
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 10, spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Row(
              children: [
                Container(
                    height: 60,
                    width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(999)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                               if(_counter>0){
                                 _counter --;
                               }
                            });
                          },
                          child: CircleAvatar(
                            radius: 22,
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Text(
                          "${_counter}",
                          style: TextStyle(fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                               _counter ++;
                            });
                          },
                          child: CircleAvatar(
                            radius: 22,
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),);

                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              const Size(double.infinity, 65)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade900),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)))),
                      child: Text("Add to cart")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsArgs {
  final dynamic id;

  const ProductDetailsArgs({required this.id});
}
