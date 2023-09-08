import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:peerp_toon/app/constants/app.colors.dart';
import 'package:peerp_toon/presentation/screens/cartScreen/cart.screen.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> imageList = [
    'assets/images/shoes/s1.png',
    'assets/images/shoes/s2.png',
    'assets/images/shoes/s3.png',
  ];

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor:  Color(0xfFffd0d7),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          child: Container(
            height:  kBottomNavigationBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddToCart()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: kBottomNavigationBarHeight,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      color: Colors.white,
                      child: Text(
                        "GO TO CART",
                        style: TextStyle(
                            fontFamily: "Libre",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: kBottomNavigationBarHeight,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    color: Colors.deepOrangeAccent,
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(
                          fontFamily: "Libre",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xfFffd0d7),
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffeae8e4),
                  borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.pinkAccent,),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xffeae8e4),
                      borderRadius: BorderRadius.circular(25)),
                child: IconButton(
                  onPressed: () async {
                    EasyLoading.show();
                    await Future.delayed(Duration(seconds: 2));
                    EasyLoading.dismiss();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item added successfully'),
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_cart, color: Colors.pinkAccent,),
                ),
                ),
              )
            ],
            flexibleSpace: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffeae8e4),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () async {
                   await Share.share("dddd");
                  },
                  icon: Icon(Icons.share, color: Colors.pinkAccent,),
                ),
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlurryContainer(

                height:MediaQuery.of(context).size.height*0.3 ,
                elevation: 0,
                blur: 0,
                borderRadius: BorderRadius.only(
                    topRight: Radius.zero, topLeft: Radius.zero),
                color:  Color(0xfFffd0d7),
                child: CarouselSlider.builder(
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      decoration: BoxDecoration(
                      ),
                      child: Image.asset(imageList[index]),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: EdgeInsets.only(bottom: 38),
                    indicatorBorderColor: Colors.black,
                  ),
                  itemCount: imageList.length,
                  initialPage: 0,
                  enableAutoSlider: false,
                ),
              ),
              SizedBox(
                height: 5,
              ),

                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                         topRight: Radius.circular(60)
                       ),
                       color: Colors.pinkAccent,
                     ),
                     child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 8),
                            Text(
                              "Red Tape Grey Sports Shoes ",
                              style: TextStyle(
                                  fontFamily: "Libre",
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              height: 70,

                              child: Card(
                                color: Color(0xffF5F5F5),
                                elevation: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '-20% ',
                                          style: TextStyle(
                                              fontFamily: "Libre",
                                              fontSize: 12,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pinkAccent),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '\$99.99',
                                          style: TextStyle(
                                              fontFamily: "Libre",
                                              letterSpacing: 1,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.pinkAccent),
                                        ),
                                      ],
                                    ),
                                    vSizedBox1,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'M.R.P',
                                          style: TextStyle(
                                            fontFamily: "Libre",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pinkAccent,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '\$200.99',
                                                style: TextStyle(
                                                  fontFamily: "Libre",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.pinkAccent,
                                                  letterSpacing: 1,
                                                  decoration: TextDecoration
                                                      .lineThrough, // Add this line for strikethrough
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlurryContainer(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white,
                                    elevation: 10,
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: Text("2x")),
                                SizedBox(width: 5,),
                                BlurryContainer(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white,
                                    elevation: 10,
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: Text("2x")),

                              ],
                            ),
                            vSizedBox1,
                            Text("Product details",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "Libre",
                            )),
                            vSizedBox2,
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Product Dimensions ‏ : ‏ 34.5 x 23 x 12.5 cm; 800 Grams\n'
                                        'Date First Available ‏ : ‏ 3 February 2023\n'
                                        'Manufacturer ‏ : ‏ Importer:-MIRZA INTERNATIONAL LTD.,14/6, CIVIL LINES, KANPUR-208001\n'
                                        'ASIN ‏ : ‏ B0BTSFDZFK\n'
                                        'Item model number ‏ : ‏ RSO2835\n'
                                        'Country of Origin ‏ : ‏ Bangladesh\n'
                                       ,
                                    style: TextStyle(
                                        fontSize: 12,
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontFamily: "Libre",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Customer Reviews",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.yellowAccent,
                                  fontFamily: "Libre"),
                            ),
                            IgnorePointer(
                              ignoring: true, // Disables user interaction
                              child: RatingBar.builder(
                                initialRating: 4.2,
                                // initialRating: 2,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20.0,
                                unratedColor: Colors.grey[300],
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                                onRatingUpdate: (double rating) {
                                  // Handle the updated rating if needed
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
                   ),
                 ),

            ],
          )
      ),
    );
  }
}
