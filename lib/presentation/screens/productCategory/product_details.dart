import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> imageList = [
    'assets/images/shoes/shoes1.jpg',
    'assets/images/shoes/shoes1.jpg',
    'assets/images/shoes/shoes1.jpg',
  ];

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("product Description"),
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
                child: Text("GO TO CART", style: TextStyle(fontFamily: "Contax",
                    fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height:  kBottomNavigationBarHeight,
                width: MediaQuery.sizeOf(context).width*0.5,
                color: Colors.deepOrangeAccent,
                child: Text("Buy Now",style: TextStyle(fontFamily: "Contax",
                    fontWeight: FontWeight.w500,
                    fontSize: 18, color: Colors.white
                ),),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlurryContainer(
              height: 400,
              elevation: 1,
              blur: 0,
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.only(topRight: Radius.zero, topLeft: Radius.zero) ,
              child: CarouselSlider.builder(

                unlimitedMode: true,
                slideBuilder: (index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageList[index]),
                          fit: BoxFit.cover

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
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      offset: Offset(0, 5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),

                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet elit. '
                          'Vestibulum at rutrum nisi.', style: TextStyle(
                        fontFamily: "Libre",
                        letterSpacing: 1,
                        fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '20% off  \$99.99',
                      style: TextStyle(
                        fontFamily: "Libre",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
