import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:peerp_toon/presentation/screens/productCategory/product_details.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

import '../../../Bloc/product_bloc.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}
bool isResponseSaving = false;

class _ProductCategoryState extends State<ProductCategory> {
  @override

  void initState() {
    if(!isResponseSaving){
      context.read<ProductBloc>().add(ProductLoadedEvent());
      isResponseSaving = true;
    }
    super.initState();
  }

  @override
  List<Product> products = [
    Product(
      image: 'assets/images/shoes/shoes2.jpg',
      title: 'Jordan',
      price: 10.99,
      discount: 0.2,
      stars: 4,
    ),
    Product(
      image: 'assets/images/shoes/shoes1.jpg',
      title: 'Nike',
      price: 15.99,
      discount: 0.1,
      stars: 5,
    ),
    Product(
      image: 'assets/images/shoes/shoes2.jpg',
      title: 'Jordan',
      price: 10.99,
      discount: 0.2,
      stars: 4,
    ),
    Product(
      image: 'assets/images/shoes/shoes1.jpg',
      title: 'Nike',
      price: 15.99,
      discount: 0.1,
      stars: 5,
    ),
    Product(
      image: 'assets/images/shoes/shoes2.jpg',
      title: 'Jordan',
      price: 10.99,
      discount: 0.2,
      stars: 4,
    ),
    Product(
      image: 'assets/images/shoes/shoes1.jpg',
      title: 'Nike',
      price: 15.99,
      discount: 0.1,
      stars: 5,
    ),
    Product(
      image: 'assets/images/shoes/shoes2.jpg',
      title: 'Jordan',
      price: 10.99,
      discount: 0.2,
      stars: 4,
    ),
    Product(
      image: 'assets/images/shoes/shoes4.jpg',
      title: 'Nike',
      price: 15.99,
      discount: 0.1,
      stars: 5,
    ),
    // Add more products as needed
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text("Continue Your Shopping",
          style: TextStyle(fontFamily: "Libre", letterSpacing: 1,
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400
        ),
        ),
        backgroundColor: Colors.pink,
      ),
      
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state){
          if( state is ProductLoadingState){
            return Center(child:
              CircularProgressIndicator(),);
          }
          else if( state is ProductLoadedState){
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.45,
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    children:
                    List.generate(state.productModel.length, (index) {
                      return LazyLoadingList(
                        index: (index),
                        initialSizeOfItems: 6,
                        hasMore: true,
                        loadMore: () => print('Loading More'),
                        child: GridTile(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0, 3),
                                    blurRadius: 0
                                  ),
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.9),
                                    offset: Offset(0, 5),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BlurryContainer(
                                          elevation: 2,
                                          borderRadius: BorderRadius.circular(6),
                                          blur: 5,
                                          padding: EdgeInsets.all(0),
                                          color: Colors.greenAccent,
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            onPressed: (){},icon: Icon(Icons.shopping_cart,color: Colors.white,),
                                          ),
                                        ),
                                      )
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      height: 200,
                                      child: Image.network(state.productModel[index].image.toString(),
                                        fit: BoxFit.fill),
                                    ),
                                    Spacer(),

                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text(state.productModel[index].title.toString(), style: TextStyle(fontSize: 12, fontFamily: "Libre"),
                                            maxLines: 1,
                                            ),
                                            SizedBox(height: 2,),
                                            BlurryContainer(
                                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                color: Colors.green,
                                                child: Text('\$${state.productModel[index].price?.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 12, letterSpacing: 1),)),
                                           SizedBox(height: 2,),
                                            BlurryContainer(
                                              color: Colors.pink,
                                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                              child: Text(
                                                '${(0.1 * 100).toInt()}% off',
                                                style: TextStyle(fontSize: 12, color: Colors.white, letterSpacing: 1),
                                              ),
                                            ),
                                            IgnorePointer(
                                              ignoring: true, // Disables user interaction
                                              child: RatingBar.builder(
                                                initialRating: double.tryParse(state.productModel[index].rating!.rate.toString()) ?? 0.0,
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
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (double rating) {
                                                  // Handle the updated rating if needed
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

                  ),
                ),
              ],
            );

      }

          else if (state is ProductErrorState){
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return SizedBox();
      })
    );
  }
}
class Product {
  final String image;
  final String title;
  final double price;
  final double discount;
  final int stars;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
    required this.stars,
  });
}