import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          labelText: 'Message',
                        ),
                        maxLines: 5,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Send message
                      },
                      child: Text('Send',style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
