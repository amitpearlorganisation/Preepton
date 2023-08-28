import 'dart:convert';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class AddressDialog extends StatefulWidget {
  @override
  _AddressDialogState createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  String _selectedCountry = 'India';
  String _selectedState = 'Kerala';
  String _selectedDistrict = 'Thiruvananthapuram';
  String _city = '';
  String _pinCode = '';
  String _houseNo = '';
  String _nearbyPlace = '';

  final _formKey = GlobalKey<FormState>();
  String _currentLocation = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlurryContainer(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.white,
            elevation: 10,
            child:SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
/*
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Current Location',
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _currentLocation,
                          enabled: false,
                        ),
*/
                    Container(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Delivery Address',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black.withOpacity(0.6),
                            letterSpacing: 1,
                            fontFamily: "Libre",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () async {
                        // var status = await Permission.location.request();
                        //
                        // if (status.isGranted) {
                        //   Position currentPosition = await Geolocator.getCurrentPosition(
                        //     desiredAccuracy: LocationAccuracy.high,
                        //   );
                        //
                        //   Navigator.push(
                        //     context,
                        //
                        //   );
                        // } else {
                        //   print("Location permission denied");
                        // }
                      },

                      child: BlurryContainer(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        elevation: 10,
                        width: double.infinity,
                          color: Colors.pink,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Pick Location', style: TextStyle(fontFamily: "Libre", color: Colors.white),))),
                    ),
                    SizedBox(height: 16),


                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'name',
                        labelText: 'Your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                        });
                      },
                    ),

                    SizedBox(height: 8.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'phone',
                        labelText: 'PhoneNumber',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                        });
                      },
                    ),
                    SizedBox(height: 8,),

                    /*Text(
                          'Select your state:',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),*/
/*
                        DropdownButton<String>(
                          value: _selectedState,
                          items: <String>[
                            'Kerala',
                            'Tamil Nadu',
                            'Karnataka',
                            'Maharashtra',
                            'Delhi'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedState = newValue!;
                            });
                          },
                        ),
*/
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your city',
                        labelText: 'City',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your pin code',
                        labelText: 'Pin Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _pinCode = value;
                        });
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Address Area Stret',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                        });
                      },
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'land Mark',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                        });
                      },
                    ),
                    SizedBox(height: 8,),


                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your house number',
                        labelText: 'House No.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _houseNo = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter a nearby landmark',
                        labelText: 'Nearby Place',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.pink.shade200,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _nearbyPlace = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(

                      onTap: () {
                        if (_formKey.currentState?.validate() == true) {
                          // Save the data and close the dialog
                          // Here, you can implement the logic to save the address details to a database or other storage solution
                          Navigator.of(context).pop();
                        }
                      },
                      child: BlurryContainer(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        color: Colors.pink,
                        elevation: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Add Address',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
