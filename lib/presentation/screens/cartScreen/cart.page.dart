import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => showContainer());

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Cart"),
        actions: <Widget>[
          MaterialButton(
              child: Text(
                "Clear",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Seller: Man To Go "),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20, right: 20),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              Image.network(
                                "https://cdn.pixabay.com/photo/2016/12/06/09/31/blank-1886008__340.png",
                                width: 100,
                                height: 100,
                              ),
                              Column(
                                children: [
                                  Text("2018 Hot Sale Spring Autumn...."),
                                  Text("₹ 2500"),
                                  Row(
                                    children: [
                                      Text("Free Shipping"),
                                      MaterialButton(
                                        color: Colors.green,
                                        onPressed: () {},
                                        child: Center(
                                          child: Text("REMOVE"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Price Details ",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black12,
                            width: 2,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [Text("Sub Total "), Text("₹ 2500")],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [Text(" Discount"), Text("-₹ 25")],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(" Estimated Tax "),
                                Text("₹ 2500")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [Text(" Delivery"), Text("Free")],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  " Total Payable",
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                Text("₹ 2500",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                MaterialButton(
                                  color: Colors.green,
                                  onPressed: () {},
                                  child: Center(child: Text("Cancel")),
                                ),
                                MaterialButton(
                                  color: Colors.red,
                                  onPressed: ()  =>_show(context),
                                  child: Center(child: Text("Next")),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),

    );
  }

}
Widget showContainer(){
  return Container(
    width: 300,
    height: 250,
    color: Colors.white54,
    alignment: Alignment.center,
    child: const Text('Breathe in... Breathe out...'),
  );
}