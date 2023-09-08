import 'dart:convert';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:peerp_toon/core/service/location_cubit/location_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/service/location_service.dart';
import '../../../core/service/locator.dart';


class AddressDialog extends StatefulWidget {
  @override
  _AddressDialogState createState() => _AddressDialogState();
}
String simCardSerialNumber = '';
LocationCubit loc = LocationCubit(LocationService());

class _AddressDialogState extends State<AddressDialog> {
  String _selectedCountry = 'India';
  String _selectedState = 'Kerala';
  String _selectedDistrict = 'Thiruvananthapuram';
  String _city = '';
  String _pinCode = '';
  String _houseNo = '';
  String _nearbyPlace = '';
  var locationService = getIt<LocationService>();
  final _formKey = GlobalKey<FormState>();
  String _currentLocation = '';
 TextEditingController cityController = TextEditingController();
 TextEditingController pinCodeController = TextEditingController();
 TextEditingController streatController = TextEditingController();
 @override
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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          // locationService.getLocation();

                          EasyLoading.show();
                          var location = await locationService.getLocation();
                          EasyLoading.dismiss();
                          List<String> parts = location.split(', ');

                          // Now, 'parts' contains all the address components separated by commas

                          // You can access the individual parts or store them in variables
                          String part1 = parts.isNotEmpty ? parts[0] : '';
                          String part2 = parts.length > 1 ? parts[1] : '';
                          String streat = parts.length > 2 ? parts[2] : '';
                          String part4 = parts.length > 3 ? parts[3] : '';
                          String city = parts.length > 4 ? parts[4] : '';
                          String part6 = parts.length > 5 ? parts[5] : '';
                          String part7 = parts.length > 6 ? parts[6]: "";
                          String input = part7;
                          RegExp regex = RegExp(r'\d+');
                          Match match = regex.firstMatch(input) as Match;
                          String? numericPart = match != null ? match.group(0) : "";
                            streatController.text = streat;
                           pinCodeController.text = numericPart!;
                          cityController.text = city;
                          print(streat );
                          setState(() {

                          });
                        },

                        child: BlurryContainer(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            elevation: 10,
                            width: double.infinity,
                            color: Colors.pink,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('Pick Location',
                                  style: TextStyle(fontFamily: "Libre",
                                      color: Colors.white),))),
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
                        initialValue: simCardSerialNumber,
                         readOnly: true,
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
                        controller: cityController,
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
                        controller: pinCodeController,
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
                        controller: streatController,
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
