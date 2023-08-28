import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

class ProductOrderHistory extends StatefulWidget {
  String img;
  String name;
  String Descritpion;

  @override
  ProductOrderHistory({required this.img, required this.name, required this.Descritpion,    Key? key,
  }): super(key: key);

  State<ProductOrderHistory> createState() => _ProductOrderHistoryDState();
}

class _ProductOrderHistoryDState extends State<ProductOrderHistory> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Product history", style: TextStyle(fontSize: 16, color: Colors.white,
        fontFamily: "Libre",
          letterSpacing: 1,
        ),),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 2
                  )
                )

              ),
              child: Text("Order ID - OD3257312498844810300", style: TextStyle(color: Colors.black.withOpacity(0.5), letterSpacing: 1),)),
          Container(
         padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        width: 2
                    )
                )

            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(widget.name),
                    vSizedBox1,
                    Text("Seller"),
                    vSizedBox1,
                    Text("Price")

                  ],
                ),

                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(widget.img),
                ),


              ],
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        width: 2
                    )
                )

            ),
            child: Text("Track Order"),

          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        width: 2
                    )
                )

            ),

            height: 50,
            child: RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 25,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        width: 2
                    )
                )

            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amit Pearl", style:
                TextStyle(color: Colors.black54, letterSpacing: 1, fontFamily: "Libre", fontSize: 14),),
                vSizedBox1,
                Text("Subash nagar",
              style  : TextStyle(color: Colors.black54, letterSpacing: 1, fontFamily: "Libre", fontSize: 12),

          ),
                vSizedBox1,
                Text("Sk Tower",
                  style  : TextStyle(color: Colors.black54, letterSpacing: 1, fontFamily: "Libre", fontSize: 12),
                ),
                vSizedBox1,
                Text("Uttarakhand",
                  style  : TextStyle(color: Colors.black54, letterSpacing: 1, fontFamily: "Libre", fontSize: 12),
                ),
                vSizedBox1,
                Text("0000000000",
                  style  : TextStyle(color: Colors.black54, letterSpacing: 1, fontFamily: "Libre", fontSize: 12),
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price Details"),
                vSizedBox2,
                Row(
                  children: [
                    Expanded(
                        flex:2,
                        child: Text("List Price")),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 2,
                        child: Text("350")),
                    ],
                ),
                vSizedBox1,
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text("Selling Price")),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 2,
                        child: Text("350")),
                  ],
                ),
                vSizedBox1,
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text("Total Amount")),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 2,
                        child: Text("350")),
                  ],
                ),
                vSizedBox1,
                Row(
                  children: [
                    Expanded(
                        flex:2,
                        child: Text("Cash on Delivery")),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 2,
                        child: Text("350")),
                  ],
                )



              ],
            ),
          )

        ],
      ),
    );
  }
}


