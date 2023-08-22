import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class UserDeliverAddressScreen extends StatefulWidget {
  @override
  _UserDeliverAddressScreenState createState() =>
      _UserDeliverAddressScreenState();
}

class _UserDeliverAddressScreenState extends State<UserDeliverAddressScreen> {
  final formKey = GlobalKey<FormState>();
  final countries = [
    {'name': 'India'},
    {'name': 'Nepal'},
  ];
  final states = [
    {'name': 'Uttarakhand'},
    {'name': 'Maharashtra'},
    {'name': 'Karnataka'},
    {'name': 'Kerala'},
    {'name': 'Tamil Nadu'},
  ];
  final districts = [
    {'name': 'Dehradun'},
    {'name': 'Haridwar'},
    {'name': 'Nainital'},
  ];

  String? _selectedCountry;
  String? _selectedState;
  String? _selectedDistrict;

  TextEditingController _cityController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _nearbyPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Deliver Address',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlurryContainer(
          width: double.infinity,
          elevation: 10,
          padding: EdgeInsets.all(10),
          color: Colors.pink.shade100,

          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButtonFormField<String>(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    decoration: InputDecoration(
                      hintText: 'Select your country',
                      icon: Icon(Icons.flag),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2.0),
                      ),
                    ),
                    value: _selectedCountry,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCountry = value;
                        _selectedState = null;
                        _selectedDistrict = null;
                        // implement logic to update state and district lists based on selected country
                      });
                    },
                    items: countries.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['name'],
                        child: Text(country['name']!),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    alignment: Alignment.center,
                     isExpanded: false,
                    decoration: InputDecoration(
                      hintText: 'Select your state',
                      icon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2.0),
                      ),
                    ),
                    value: _selectedState,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedState = value;
                        _selectedDistrict = null;
                        // implement logic to update district list based on selected state
                      });
                    },
                    items: states.map((state) {
                      return DropdownMenuItem<String>(
                        value: state['name'],
                        child: Text(state['name']!),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    decoration: InputDecoration(
                      hintText: 'Select your district',
                      icon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2.0),
                      ),
                    ),
                    value: _selectedDistrict,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedDistrict = value;
                      });
                    },
                    items: districts.map((district) {
                      return DropdownMenuItem<String>(
                        value: district['name'],
                        child: Text(district['name']!),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText: 'City',
                      icon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2.0, color: Colors.white70),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _zipCodeController,
                    decoration: InputDecoration(
                      hintText: 'Zip Code',
                      icon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2.0,  color: Colors.white70),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a zip code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nearbyPlaceController,
                    decoration: InputDecoration(
                      hintText: 'Nearby Place',
                      icon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2.0,  color: Colors.white70),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a nearby place';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // implement logic to add address to user's address list
                        // and navigate back to previous screen
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add Address'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
