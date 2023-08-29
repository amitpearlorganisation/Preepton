


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:peerp_toon/Bloc/product_bloc.dart';
import 'package:peerp_toon/app/models/product_models.dart';
import 'package:peerp_toon/presentation/screens/productCategory/productCategory.dart';
import 'package:provider/provider.dart';
import '../../../../app/constants/app.assets.dart';
import '../../../../app/constants/app.colors.dart';
import '../../../../app/routes/routes_imports.dart';
import '../../../../core/api/sellerlist.dart';
import '../../../../core/notifiers/theme.notifier.dart';
import '../../../widgets/custom.text.style.dart';
import '../../../widgets/dimensions.widget.dart';
import '../../categoryScreen/category_imports.dart';

class BrandWidget extends StatefulWidget {
  const BrandWidget({Key? key}) : super(key: key);

  @override
  State<BrandWidget> createState() => _BrandWidgetState();
}
bool isResponseSaved = false;

class _BrandWidgetState extends State<BrandWidget> {
  List<Map<String, dynamic>> _category = List.generate(
    10,
        (index) => {
      'name': 'Category $index',
      'image': 'assets/category_$index.png', // Assuming you have these images
    },
  );

  int _visibleItemCount = 2; // Number of initially visible items
  bool _showAll = false;

  @override
  void initState() {
    if(!isResponseSaved){
    context.read<ProductBloc>().add(ProductLoadedEvent());
    isResponseSaved = true;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;

    List<String> _categories = [
      "Jordan's",
      "Adidas",
      "Puma",
      "Reebok",
      "Nike",
    ];
    List<Map<String, dynamic>> _category = [
      {
        'name': 'Mobile & Tablet',
        'image': 'assets/images/shoes/jordan.png',
      },
      {
        'name': 'Electronics',
        'image': 'assets/images/shoes/jordan.png',
      },
      {
        'name': 'TV & Appliances',
        'image': 'assets/images/shoes/jordan.png',
      },
      {
        'name': 'Fashion',
        'image': "assets/images/shoes/jordan.png",
      },
      {
        'name': 'Beauty',
        'image': 'assets/images/shoes/jordan.png',
      },
      {
        'name': 'Home & Furniture',
        'image': 'assets/images/shoes/jordan.png',
      },
      {
        'name': 'Grocery',
        'image': 'assets/images/shoes/jordan.png',
      },
    ];
    List<String> _categoriesImages = [
      AppAssets.brandJordan,
      AppAssets.brandAdidas,
      AppAssets.brandPuma,
      AppAssets.brandReebok,
      AppAssets.brandNike
    ];

    showBrands(String text, String images) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.categoryRoute,
            arguments: CategoryScreenArgs(categoryName: text),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            elevation: 0,
            color: themeFlag ? AppColors.mirage : AppColors.creamColor,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Image.network(images),
                ),
                vSizedBox1,
                Text(
                  text,
                  style: CustomTextWidget.bodyText2(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 150,
          child:
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {

              if (state is ProductLoadingState) {
                return  Center(
                  child: LoadingAnimationWidget.discreteCircle(
              size: 50, color: Colors.green,
                    secondRingColor: Colors.deepOrangeAccent,
                    thirdRingColor: Colors.redAccent
              ),
                );
              } else if (state is ProductLoadedState) {

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.productModel.length,
                  itemBuilder: (context, index) {
                    String title = state.productModel[index].title.toString();
                    List<String> words = title.split(" ");
                    String firstWord = words.isNotEmpty ? words[0] : "";

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductCategory()),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        shadowColor: Colors.grey.withOpacity(0.6),
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 90, // Adjust the height as needed
                              width: 90,
                              // Adjust the width as needed
                              padding: EdgeInsets.all(8),
                              child: Image.network(
                                state.productModel[index].image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 120,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  firstWord,
                                  style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.6),
                                  letterSpacing: 1, fontFamily: "Libre"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );

              } else if (state is ProductErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return SizedBox();
            },
          ),
        ),
        vSizedBox2,
        Text(
          "Recently Viewed Stores",
          style:
          TextStyle(
              color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 1 ,
              fontFamily: "Libre"
          ),
        ),
        vSizedBox1,
        Container(
          height: 180,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductLoadedState) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.productModel.length,
                  itemBuilder: (context, index) {
                    String title = state.productModel[index].title.toString();
                    List<String> words = title.split(" ");
                    String firstWord = words.isNotEmpty ? words[0] : "";
                    return Container(
                      width: 200,
                      child: Card(
                        elevation: 1,
                        shadowColor: Colors.grey.withOpacity(0.8),
                        margin: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100, // Adjust the height as needed
                              width: 100,
                              padding: EdgeInsets.all(8),
                              child: Image.network(
                                state.productModel[index].image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Controls the position of the shadow
                              ),
                            ],
                          ),
                                  child: Text("27% off", style:
                                  TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.9),
                                      letterSpacing: 1, fontFamily: "Libre"),
                                  ),
                                ),
                                Text(firstWord, style:
                                TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.6),
                                    letterSpacing: 1, fontFamily: "Libre"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ProductErrorState) {
                return Text(state.errorMessage);
              }
              return SizedBox();
            },
          ),
        ),
        vSizedBox1,
        Text(
          "Popular Products",
          style:
          TextStyle(
              color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 1 ,
              fontFamily: "Libre"
          ),
        ),
        SizedBox(height: 5,),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  elevation: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          _category[index]['image'],
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // Controls the position of the shadow
                                ),
                              ],
                            ),
                            child: Text("27% off", style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1,
                                fontFamily: "Libre",
                                fontSize: 12, color: Colors.white)),
                          ),
                          SizedBox(height: 5,),

                          Text(_category[index]['name'], style: TextStyle(fontSize: 12, fontFamily: "Libre",color: Colors.black.withOpacity(0.6)),),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        vSizedBox1,
        Text(
          "Recommended Products",
          style:
          TextStyle(
              color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 1 ,
              fontFamily: "Libre"
          ),
        ),
        vSizedBox1,
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                child: Card(
                  elevation: 4,
                 shadowColor: Colors.grey.withOpacity(0.7),
                 margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                 color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          _category[index]['image'],
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Controls the position of the shadow
                                    ),
                                  ],
                                ),
                                child: Text("27% off", style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1,
                                    fontFamily: "Libre",
                                    fontSize: 12, color: Colors.white)),
                              ),
                              SizedBox(height: 5,),
                              Text(_category[index]['name'], style: TextStyle(fontSize: 12, fontFamily: "Libre", color: Colors.black.withOpacity(0.6))),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        vSizedBox2,
        Text(
          "All Products",
          style:
          TextStyle(
              color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 1 ,
          fontFamily: "Libre"
          ),
        ),
        vSizedBox2,

        Container(
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: _showAll ? _category.length : _visibleItemCount,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: Card(
                  elevation: 10,
                  margin: EdgeInsets.only(right: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        child: Image.asset(
                          _category[index]['image'],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          _category[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: "Libre",
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(0.6)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        vSizedBox2,
        if (!_showAll)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent, // Accent pink color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded border
              ),
            ),
            onPressed: () {
              setState(() {
                _showAll = true;
              });
            },
            child: Text('See All'),
          ),
      ],

/*
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: SellerAPI.sellerlist(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${snapshot.error}occurred",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {

                      return ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemCount:  snapshot.data!.sellers!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return showBrands(
                            snapshot.data!.sellers![index].name.toString(),
                              snapshot.data!.sellers![index].profilePhoto.toString(),
                          );
                        },
                      );
                    }
                  } // Displaying LoadingSpinner to indicate waiting state

                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ))
*/
    );
  }
}
