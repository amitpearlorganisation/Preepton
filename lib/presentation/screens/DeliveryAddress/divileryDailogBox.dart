import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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

  void _pickLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation =
        '${position.latitude.toString()}, ${position.longitude.toString()}';
      });
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.pink[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),

      ),

      child: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: (){
                    _pickLocation();
                    print('_pickLocation'+_currentLocation);
                  },

                  child: Text('Pick Location'),
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
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(

                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        // Save the data and close the dialog
                        // Here, you can implement the logic to save the address details to a database or other storage solution
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Add Address',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
