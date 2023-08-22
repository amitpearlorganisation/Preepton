import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:peerp_toon/presentation/screens/productCategory/product_details.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Continue Your Shopping"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state){
          if( state is ProductLoadingState){
            return Center(child:
              CircularProgressIndicator(),);
          }
          else if( state is ProductLoadedState){
            return       CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(10.0),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.45,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: List.generate(state.productModel.length, (index) {
                      return Expanded(
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
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(0, 2),
                                  ),
                                  BoxShadow(
                                    color: Colors.blueGrey.withOpacity(0.2),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(state.productModel[index].image.toString(), fit: BoxFit.fill,height: 200,width: double.infinity,),
                                  SizedBox(height: 10,),
                                  Text(state.productModel[index].title.toString()),
                                  Text('\$${state.productModel[index].price?.toStringAsFixed(2)}'),
                                  Text(
                                    '${(0.1 * 100).toInt()}% off',
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