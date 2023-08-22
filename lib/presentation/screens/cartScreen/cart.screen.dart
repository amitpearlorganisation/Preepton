import 'dart:io' as io;


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peerp_toon/Cubit/get_cart_cubit.dart';
import 'package:peerp_toon/app/constants/app.colors.dart';
import 'package:peerp_toon/presentation/screens/DeliveryAddress/divileryDailogBox.dart';

import '../GateWayPayment/appInPurchase.dart';
import '../GateWayPayment/paypal.dart';

class Product {
  String name;
  String image;
  double price;
  int quantity;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  List<Product> _products = [
    Product(
      name: 'Product 1',
      image: 'assets/images/shoes/jordan.png',
      price: 9.99,
    ),
    Product(
      name: 'Product 2',
      image: 'assets/images/shoes/jordanT.png',
      price: 14.99,
    ),
    Product(
      name: 'Product 3',
      image: 'assets/images/shoes/shoes2.jpg',
      price: 19.99,
    ),
    Product(
      name: 'Product 1',
      image: 'assets/images/shoes/shoes1.jpg',
      price: 9.99,
    ),
    Product(
      name: 'Product 1',
      image: 'assets/images/shoes/shoes3.jpg',
      price: 9.99,
    ),
    Product(
      name: 'Product 1',
      image: 'assets/images/shoes/shoes4.jpg',
      price: 9.99,
    ),
  ];

  double _totalPrice() {
    double totalPrice = 0.0;
    _products.forEach((product) {
      totalPrice += product.price * product.quantity;
    });
    return totalPrice;
  }

  int _totalQuantity() {
    int totalQuantity = 0;
    _products.forEach((product) {
      totalQuantity += product.quantity;
    });
    return totalQuantity;
  }

  void _increaseQuantity(int index) {
    setState(() {
      _products[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    if (_products[index].quantity > 0) {
      setState(() {
        _products[index].quantity--;
      });
    }
  }

  void _removeProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (BuildContext context, int index) {
                return Builder(
                    builder: (BuildContext context) {
                      return Dismissible(
                          key: Key(_products[index].name),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _removeProduct(index);
                          },
                          background: Container(
                            color: Colors.red,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          child: Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    _products[index].image,
                                    height: 100.0,
                                    width: 100.0,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        _products[index].name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Price: \$${_products[index]
                                            .price}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () =>
                                          _decreaseQuantity(index),
                                    ),
                                    Text('${_products[index].quantity}'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () =>
                                          _increaseQuantity(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      );
                    }
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Products: ${_totalQuantity()}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'Total Price: \$${_totalPrice().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.buttoColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              if (io.Platform.isMacOS) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppInPurchaseScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressDialog(),
                  ),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PayPalScreen(
                //       totalPrice: _totalPrice(),
                //       totalProducts:_totalQuantity(), title: 'Peeptoon',
                //     ),
                //   ),
                // );
              }
            },


            child: Text('Check Out'),
          ),
        ),
      ),
    );
  }
}
