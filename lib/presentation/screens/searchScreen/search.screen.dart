import 'dart:convert';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/app.assets.dart';
import '../../../app/constants/app.colors.dart';
import '../../../core/notifiers/product.notifier.dart';
import '../../../core/notifiers/theme.notifier.dart';
import '../../widgets/custom.loader.dart';
import '../../widgets/custom.text.style.dart';
import '../../widgets/dimensions.widget.dart';
import '../../widgets/shimmer.effects.dart';
import '../categoryScreen/widgets/category.widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Item> items = [
    Item(
      name: "apple 13",
      category: "Phone",
      brand: "apple",
      price: 500,
      discount: 10,
      mrp: 550,
      image: "assets/images/ipohone.png",
      description: "Powerful, Sleek, Cameras, Performance",
      rating: 5,
      itemCount: 5
    ),
    Item(
      name: "samsung Galaxy M13",
      category: "phone",
      brand: "samsung",
      price: 600,
      discount: 15,
      mrp: 700,
      image: "assets/images/sumsung.png",
      description: " 5G (Green, 8GB, 128GB Storage)",
      rating: 4.5,
      itemCount: 5
    ),
    Item(
      name: "nokia 2660 Flip 4G",
      category: "phone",
      brand: "nokia",
      price: 400,
      discount: 5,
      mrp: 420,
      image: "assets/images/nokia.png",
      description: " All-Day Battery, 4GB RAM (2GB RAM + 2GB Virtual RAM) + 64GB Capacity | Dark Cyan",
      rating: 1.0,
      itemCount: 1
    ),
    Item(
      name: "realme narzo N55",
      category: "Phone",
      brand: "Realme",
      price: 300,
      discount: 10,
      mrp: 330,
      image: "assets/images/Realme-PNG.png",
      description:"(Navy Blue, 3GB RAM, 64GB Storage) with No Cost EMI/Additional Exchange Offers",
      rating: 2.0,
      itemCount: 2

    ),
    Item(
      name: "oppo A78 5G",
      category: "phone",
      price: 600,
      brand: "oppo",
      discount: 15,
      mrp: 700,
      image: "assets/images/oppo.png",
      description: "5G (Bold Gold, 8GB RAM, 256GB Storage) | 5000 mAh Battery with 67W SUPERVOOC",
      rating: 3.5,
      itemCount: 4
    ),
    Item(description: "description",
        name: "HeadPhone",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/headphone.png",
        brand: "brand", rating:
        5.0, itemCount: 5),

    Item(description: "description",
        name: "HeadPhone",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/headphone2.png",
        brand: "brand",
        rating: 2.5,
        itemCount: 3),
    Item(description: "description",
        name: "iron",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/iron.png",
        brand: "brand",
        rating: 1.5,
        itemCount: 2),
    Item(description: "description",
        name: "iron",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/iron.png",
        brand: "brand",
        rating: 1.5,
        itemCount: 2),
    Item(
        description: "description",
        name: "Speaker",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/smartSpeaker.png",
        brand: "brand",
        rating: 1.5,
        itemCount: 2),
    Item(description: "description",
        name: "Speaker",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/smartSpeaker2.png",
        brand: "brand",
        rating: 1.5,
        itemCount: 2),
    Item(description: "description",
        name: "watch",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/watch1.png",
        brand: "brand",
        rating: 1.5,
        itemCount: 2),
    Item(description: "description",
        name: "watch",
        category: "electronic",
        price: 500,
        discount: 10.0,
        mrp: 600,
        image: "assets/images/watch2.png",
        brand: "brand",
        rating: 1.5,
        itemCount: 2),


    // Add more items for other categories
  ];

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        appBar: AppBar(title: Text('Item Search', style: TextStyle(fontFamily: "Libre", fontSize: 14, color: Colors.white,
        ),

        ),
        backgroundColor: Colors.pink,
        ),
    body: ItemList(items: items));} }



class ItemList extends StatefulWidget {
  final List<Item> items;

  ItemList({required this.items});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  String _searchQuery = '';


  @override
  Widget build(BuildContext context) {
    List<Item> filteredItems = widget.items.where((item) {
      return item.category.contains(_searchQuery) ||
          item.brand.contains(_searchQuery) ||
          item.name.contains(_searchQuery);
    }).toList();
    return
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlurryContainer(
              height: 50,
              color: Colors.white,
              elevation: 2,
              child: Row(
                children: [
                  Icon(Icons.search),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                         border: InputBorder.none,
                          errorBorder: InputBorder.none, // Remove error border
                          disabledBorder: InputBorder.none, // Remove disabled border
                        ),                onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  childAspectRatio: 0.6,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  Item item = filteredItems[index];
                  return Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    shadowColor: Colors.white.withOpacity(0.9),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 15,),
                            Container(
                                height: 150,
                                padding: EdgeInsets.all(10),
                                child: Image.asset(item.image)),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(item.name,style: TextStyle(fontSize: 12, fontFamily: "Libre",color: Colors.green,letterSpacing: 1),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${item.price.toStringAsFixed(2)} \$',style:TextStyle(fontSize: 12, fontFamily: "Libre")),
                                  RatingBar.builder(
                                    initialRating: item.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: item.itemCount,
                                    itemSize: 12.0,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ), onRatingUpdate: (double value) {  },
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2.0),
                              child: Text(item.description,
                                maxLines: 2,
                                style: TextStyle(fontSize: 12, fontFamily: "Libre",color: Colors.black.withOpacity(0.6),letterSpacing: 1),),
                            ),

                          ],
                        ),
                        if (item.discount != 0.0)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.red,
                              child: Text(
                                '${item.discount.toStringAsFixed(2)}% off',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Libre",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );

                },
              ),
            ),
          ),
        ],
      );  }
}


class Item {
  final String name;
  final String category;
  final double price;
  final double discount;
  final double mrp;
  final String image;
  final String brand;
  final String description;
  final double rating;
  final int  itemCount;
  Item({
    required this.description,
    required this.name,
    required this.category,
    required this.price,
    required this.discount,
    required this.mrp,
    required this.image,
    required this.brand,
    required this.rating,
    required this.itemCount
  });
}