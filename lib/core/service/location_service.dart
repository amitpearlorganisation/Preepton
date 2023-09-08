import 'dart:async';

import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter_geocoder/geocoder.dart';

import 'location_model.dart';

class LocationService {
  Location location = new Location();
  late LocationModel currentLocation;


  Future<String> getLocation() async {
    try {
      var userLocation = await location.getLocation();

      // Remove the initialization of currentLocation here

      print("my location longitude ${userLocation.longitude}");
      print("my location  latitude ${userLocation.latitude}");
      final coordinates =
      new Coordinates(userLocation.latitude!, userLocation.longitude!);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;

      print("my first address--------- $first\n\n ${first.featureName} : my last address --------${first.addressLine}");
      String formattedAddress = '${first.featureName}, ${first.addressLine}';


      return formattedAddress;
    } catch (e) {
      if (e is PlatformException) {
        print(e.message);
      }
    }
    return "";
  }
}



// StreamController<LocationModel> locationController =
// StreamController<LocationModel>.broadcast();
//
// Stream<LocationModel> get getData => locationController.stream;

// LocationService() {
//   location.requestPermission().then((permissionStatus) {
//     if (permissionStatus == PermissionStatus.granted) {
//       location.onLocationChanged.listen((locationData) async {
//         currentLocation = LocationModel(
//             latitude: locationData.latitude!,
//             longitude: locationData.longitude!);
//
//         locationController.add(currentLocation);
//
//
//
//       });
//     }
//   });
// }
