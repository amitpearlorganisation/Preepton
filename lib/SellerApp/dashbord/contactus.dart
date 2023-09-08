import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peerp_toon/presentation/widgets/dimensions.widget.dart';

class Contact extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/getIntouch.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, size: 25, color: Colors.pinkAccent,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ],
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text("Get in touch".toUpperCase(), style: TextStyle(fontFamily: "Libre", letterSpacing: 1, fontWeight: FontWeight.w400),),
                      vSizedBox1,
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(10), // Adjust the padding as needed.
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(10), // Adjust the padding as needed.
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(10), // Adjust the padding as needed.
                        ),
                        maxLines: 5,
                      ),
                      vSizedBox3
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.11,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Send message
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(90)
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.send, color: Colors.white,),
                    ),
                  )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
