import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends Container {
  final String name;
  final String imageUrl;
  final double price;

  ProductListWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,),
      child: BlurryContainer(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.5,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imageUrl,
              fit: BoxFit.scaleDown,
              height: 150,
              width: double.infinity,
            ),
            SizedBox(height: 10),
            Text(name, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('\$$price', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
