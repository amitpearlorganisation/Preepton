import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:peerp_toon/presentation/screens/myorderscreen/product_his_description.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

class OrderTrackerScreen extends StatefulWidget {
  const OrderTrackerScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackerScreen> createState() => _OrderTrackerScreen();
}

class _OrderTrackerScreen extends State<OrderTrackerScreen> {
  final List<OrderData> orders = [
    OrderData(
      imageUrl: 'assets/images/headphone.png',
      status: 'Delivered on Feb 16',
      productName: 'Product A',
    ),
    OrderData(
      imageUrl: 'assets/images/ipohone.png',
      status: 'Delivered on Feb 18',
      productName: 'Product B',
    ),
    OrderData(
      imageUrl: 'assets/images/smartSpeaker2.png',
      status: 'Delivered on Feb 18',
      productName: 'Product B',
    ),
    OrderData(
      imageUrl: 'assets/images/watch1.png',
      status: 'Delivered on Feb 18',
      productName: 'Product B',
    ),
    // Add more order data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pinkAccent),
      backgroundColor: Color(0xffF9F9F7),
      body: SafeArea(
        child: Column(
          children: [
            vSizedBox1,
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    5.0, 0.0, 5.0, 2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          // Transparent background
                          borderRadius:
                          BorderRadius.circular(15),
                          // Rounded corners
                          border: Border.all(
                            color: Colors.black
                                .withOpacity(0.2),
                            // White border color
                            width: 2, // Border width
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              child: Icon(
                                Icons.search,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.black),

                                  decoration: InputDecoration(
                                      hintText:
                                      "search order",
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          letterSpacing: 1,
                                          fontFamily: "Libre",
                                          fontSize: 14),
                                      border:
                                      OutlineInputBorder(
                                          borderSide:
                                          BorderSide
                                              .none)),
                                )),

                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: IconButton(onPressed: (){
                                  _openBottomSheet(context);
                                },icon: Icon(Icons.line_weight),)),
                            Expanded(
                                flex: 1,
                                child: Text("Filter")),
                          ],
                        ))
                  ],
                )
            ),
            vSizedBox2,
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    elevation: 1,
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    child: ListTile(
                      leading: Image.asset(
                        order.imageUrl, // Assuming the asset path is like "assets/image_1.png"
                        width: 50, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                      ),
                      title: Text(order.productName,style: TextStyle(fontFamily: "Libre", fontSize: 14, letterSpacing: 1, color: Colors.black.withOpacity(0.6)),),
                      subtitle: Text(order.status, style: TextStyle(fontFamily: "Libre", fontSize: 12, letterSpacing: 1),),
                      trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.black.withOpacity(0.6), size: 14,),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOrderHistory(img: order.imageUrl.toString(), name: order.productName.toString(), Descritpion: "Descritpion")));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xfFf57a43), // Light orange
                Colors.pinkAccent.withOpacity(0.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.6),
                          fontFamily: "Libre"
                      ),
                    ),
                    Text('clear filter', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: "Libre"
                    )),
                  ],

                ),
                Text('orderStatus',
                    style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: "Libre"
                )
                ),
                vSizedBox2,

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        )
                      ),
                      child: Text("On the way",
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                          fontFamily: "Libre"
                      )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          )
                      ),
                      child: Text("Delivred",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                              fontFamily: "Libre"
                          )

                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          )
                      ),
                      child: Text("Cancelled",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                              fontFamily: "Libre"
                          )
                      ),
                    ),


                  ],
                ),
                vSizedBox1,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      )
                  ),
                  child: Text("Returned",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                          fontFamily: "Libre"
                      )

                  ),
                ),

                vSizedBox1,

                Text('Order Time',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: "Libre"
                    )
                ),
                vSizedBox1,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          )
                      ),
                      child: Text("Last 30 days",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                              fontFamily: "Libre"
                          )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          )
                      ),
                      child: Text("2022 +",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                              fontFamily: "Libre"
                          )

                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          )
                      ),
                      child: Text("2021",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                              fontFamily: "Libre"
                          )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          )
                      ),
                      child: Text("2020",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                              fontFamily: "Libre"
                          )

                      ),
                    ),

                  ],
                ),
                vSizedBox1,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      )
                  ),
                  child: Text("2019",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                          fontFamily: "Libre"
                      )

                  ),
                ),




                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Background color
                        onPrimary: Colors.black, // Text color
                        side: BorderSide(color: Colors.white, width: 2), // Border color and width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // No border radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the bottom sheet
                      },
                      child: Text('Cancel', style: TextStyle(fontFamily: "Libre", letterSpacing: 1),),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent, // Background color
                        onPrimary: Colors.black, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // No border radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the bottom sheet
                      },
                      child: Text('Apply', style: TextStyle(color: Colors.white, letterSpacing: 1, fontFamily: "Libre"),),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OrderData {
  final String imageUrl;
  final String status;
  final String productName;

  OrderData({
    required this.imageUrl,
    required this.status,
    required this.productName,
  });
}