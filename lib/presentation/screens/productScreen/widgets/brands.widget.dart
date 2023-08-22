
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          height: 120,
          child:
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {

              if (state is ProductLoadingState) {
                return const Center(
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

                    return GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductCategory()));
                     },
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Image.network(
                              state.productModel[index].image.toString(),
                              height: 80,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                            Text(firstWord),
                          ],
                        ),
                      ),
                    );

                  }
                  ,
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
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        vSizedBox1,
        Container(
          height: 200,
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
                    return Flexible(
                      child: Container(
                        width: 130,
                        child: Card(
                          elevation: 1,
                          child: Column(
                            children: [
                              Image.network(
                                state.productModel[index].image.toString(),
                                height: 100,
                                fit: BoxFit.scaleDown,
                              ),
                              Text(state.productModel[index].title.toString()),
                            ],
                          ),
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
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                child: Card(
                  elevation: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        _category[index]['image'],
                        height: 100,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(_category[index]['name']),
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
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        Container(
          height: 150,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClayContainer(

                  color: Colors.blueGrey,
                  depth: 40,
                  spread: 40,
                  parentColor: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        _category[index]['image'],
                        height: 100,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(_category[index]['name']),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        vSizedBox1,
        Text(
          "All Products",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        Container(
            width: double.infinity,
            color: Colors.red,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: _category.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        _category[index]['image'],
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          _category[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))

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
      ],
    );
  }
}
