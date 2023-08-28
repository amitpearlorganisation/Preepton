import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:peerp_toon/app/constants/app.colors.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

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
    return Scaffold(
      backgroundColor: AppColors.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Product Description",   style: TextStyle(fontFamily: "Libre", letterSpacing: 1,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400
        ),),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Container(
          height:  kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height:  kBottomNavigationBarHeight,
                width: MediaQuery.sizeOf(context).width*0.5,
                color: Colors.white,
                child: Text("GO TO CART", style: TextStyle(fontFamily: "Libre",
                    fontWeight: FontWeight.w500,
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(0.7)
                ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height:  kBottomNavigationBarHeight,
                width: MediaQuery.sizeOf(context).width*0.5,
                color: Colors.deepOrangeAccent,
                child: Text("BUY NOW",style: TextStyle(fontFamily: "Libre",
                    fontWeight: FontWeight.w500,
                    fontSize: 14, color: Colors.white,
                  letterSpacing: 1
                ),),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlurryContainer(
              height: 400,
              elevation: 0.1,
              blur: 0,
              borderRadius: BorderRadius.only(topRight: Radius.zero, topLeft: Radius.zero) ,
              color: Colors.white.withOpacity(0.8),
              child: CarouselSlider.builder(

                unlimitedMode: true,
                slideBuilder: (index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageList[index]),
                          fit: BoxFit.fill

                      ),
                    ),
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
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Text(
                      "Red Tape Grey Sports Shoes for Men's- Lace-Up Shoes, Perfect Walking & Running Shoes for Men"
                      , style: TextStyle(
                        fontFamily: "Libre",
                        color: Colors.black.withOpacity(0.6),
                        letterSpacing: 1,
                        fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '-20% ',
                          style: TextStyle(
                              fontFamily: "Libre",
                              fontSize: 12,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.withOpacity(0.6)
                          ),
                        ),

                        SizedBox(width: 5,),

                        Text(
                          '\$99.99',
                          style: TextStyle(
                            fontFamily: "Libre",
                            letterSpacing: 1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6)
                          ),
                        ),
                      ],
                    ),
                    vSizedBox1,
                    Row(
                      children: [
                        Text(
                          'M.R.P',
                          style: TextStyle(
                              fontFamily: "Libre",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            letterSpacing: 1,
                          ),
                        ),

                        SizedBox(width: 5,),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$200.99',
                                style: TextStyle(
                                  fontFamily: "Libre",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  letterSpacing: 1,
                                  decoration: TextDecoration.lineThrough, // Add this line for strikethrough

                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                         vSizedBox1,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Product details\n',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "Libre",

                            ),
                          ),
                          TextSpan(
                            text: 'Product Dimensions ‏ : ‏ 34.5 x 23 x 12.5 cm; 800 Grams\n'
                                'Date First Available ‏ : ‏ 3 February 2023\n'
                                'Manufacturer ‏ : ‏ Importer:-MIRZA INTERNATIONAL LTD.,14/6, CIVIL LINES, KANPUR-208001\n'
                                'ASIN ‏ : ‏ B0BTSFDZFK\n'
                                'Item model number ‏ : ‏ RSO2835\n'
                                'Country of Origin ‏ : ‏ Bangladesh\n'
                                'Department ‏ : ‏ Mens\n'
                                'Manufacturer ‏ : ‏ Importer:-MIRZA INTERNATIONAL LTD.,14/6, CIVIL LINES, KANPUR-208001, Importer:-MIRZA INTERNATIONAL LTD.,14/6, CIVIL LINES, KANPUR-208001\n'
                                'Packer ‏ : ‏ Importer:-MIRZA INTERNATIONAL LTD.,14/6, CIVIL LINES, KANPUR-208001\n'
                                'Importer ‏ : ‏ Importer:-MIRZA INTERNATIONAL LTD.,14/6, CIVIL LINES, KANPUR-208001\n'
                                'Item Weight ‏ : ‏ 800 g\n'
                                'Item Dimensions LxWxH ‏ : ‏ 34.5 x 23 x 12.5 Centimeters\n'
                                'Net Quantity ‏ : ‏ 1 Set\n'
                                'Generic Name ‏ : ‏ Walking Shoes\n',
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "Libre",
                              fontWeight: FontWeight.w400

                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("Customer Reviews", style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.8), fontFamily: "Libre"),),
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
                          color: Colors.green,
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
          ],
        ),
      )
    );
  }
}
