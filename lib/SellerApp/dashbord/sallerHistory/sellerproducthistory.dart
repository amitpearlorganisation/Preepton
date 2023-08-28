import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/models/prodectModel.dart';

class ProductHistory extends StatelessWidget {
  final List<String> _tabs = ['Your Product', 'Soldout'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Your Products", style: TextStyle(color: Colors.black),)
      ),
      body: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),

            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,

              bottom: TabBar(
                tabs: _tabs.map((String tab) {
                  return Tab(text: tab,icon: Transform.rotate(
                    angle: -90 * (3.14 / 180),
                    child: Icon(Icons.shopping_cart),
                  ),);
                }).toList(),
                indicatorColor: Colors.white,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              PremiumScreen(),
              PremiumWizardScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumScreen extends StatelessWidget {
  static final List<Product> products = [
    Product(name: 'Product 1', icon: Icons.ac_unit, price: 9.99, soldOut: false),
    Product(name: 'Product 2', icon: Icons.access_alarm, price: 19.99, soldOut: true),
    Product(name: 'Product 3', icon: Icons.accessibility, price: 29.99, soldOut: false),
    Product(name: 'Product 4', icon: Icons.account_balance, price: 39.99, soldOut: true),
    Product(name: 'Product 5', icon: Icons.account_box, price: 49.99, soldOut: false),
    Product(name: 'Product 1', icon: Icons.ac_unit, price: 9.99, soldOut: false),
    Product(name: 'Product 2', icon: Icons.access_alarm, price: 19.99, soldOut: true),
    Product(name: 'Product 3', icon: Icons.accessibility, price: 29.99, soldOut: false),
    Product(name: 'Product 4', icon: Icons.account_balance, price: 39.99, soldOut: true),
    Product(name: 'Product 5', icon: Icons.account_box, price: 49.99, soldOut: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(products[index].icon),
              title: Text(products[index].name),
              subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
              trailing: products[index].soldOut
                  ? Chip(
                backgroundColor: Colors.red,
                label: Text(
                  'Sold Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class PremiumWizardScreen extends StatelessWidget {
  @override
  static final List<Product> products = [
    Product(name: 'Product 1', icon: Icons.ac_unit, price: 9.99, soldOut: true),
    Product(name: 'Product 2', icon: Icons.access_alarm, price: 19.99, soldOut: true),
    Product(name: 'Product 3', icon: Icons.accessibility, price: 29.99, soldOut: true),
    Product(name: 'Product 4', icon: Icons.account_balance, price: 39.99, soldOut: true),
    Product(name: 'Product 5', icon: Icons.account_box, price: 49.99, soldOut: true),
  ];


  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(products[index].icon),
              title: Text(products[index].name),
              subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
              trailing: products[index].soldOut
                  ? Chip(
                backgroundColor: Colors.red,
                label: Text(
                  'Sold Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final IconData icon;
  final double price;
  final bool soldOut;

  Product({
    required this.name,
    required this.icon,
    required this.price,
    required this.soldOut,
  });
}



