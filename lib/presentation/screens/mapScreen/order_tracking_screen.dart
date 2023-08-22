// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class OrderTrackingScreen extends StatefulWidget {
//   @override
//   _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
// }
//
// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//   late final GoogleMapController mapController; //contrller for Google map
//   PolylinePoints polylinePoints = PolylinePoints();
//
//   String googleAPiKey = "AIzaSyCLmi7d9HhYyDKPMK8qZ-zMU8K9lMzKyh8";
//   Location currentLiveLocation = Location();
//   Set<Marker> markers = Set(); //markers for google map
//   Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
//
//   LatLng startLocation = LatLng(30.3461374, 77.918174);
//   LatLng endLocation = LatLng(30.2870, 77.9983);
//
//   ///************** Function For Enable Permission, Get Current location ***************///
//
//   ///************** Function For Show Current Location **************///
//
//   void getCurrentLiveLocation() async {
//     var location = await currentLiveLocation.getLocation();
//     currentLiveLocation.onLocationChanged.listen((LocationData Loc) {
//       mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//           target: LatLng(Loc.latitude ?? 0.0, Loc.longitude ?? 0.0),
//           zoom: 12.0)));
//       print(Loc.longitude);
//       print(Loc.latitude);
//       setState(() {
//         markers.add(Marker(
//             markerId: MarkerId('Live Location'),
//             position: LatLng(Loc.latitude ?? 0.0, Loc.longitude ?? 0.0)));
//       });
//     });
//   }
//
//   Future<void> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ///********* Permissions are denied, next time you could try
//         ///********* requesting permissions again (this is also where
//         ///********* Android's shouldShowRequestPermissionRationale
//         ///********* returned true. According to Android guidelines
//         ///********* your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       ///*********** Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     ///********** When we reach here, permissions are granted and we can
//     ///********** continue accessing the position of the device.
//
//     Position position = await Geolocator.getCurrentPosition();
//     setState(() {
//       startLocation = LatLng(position.latitude, position.longitude);
//       // endLocation = LatLng(position.latitude, position.longitude);
//       // otherLocation = LatLng(position.latitude, position.longitude);
//     });
//   }
//
//   @override
//   void initState() {
//     getCurrentLiveLocation();
//
//     markers.add(Marker(
//       //add start location marker
//       markerId: MarkerId(startLocation.toString()),
//       position: startLocation, //position of marker
//       infoWindow: InfoWindow(
//         //popup info
//         title: 'Starting Point ',
//         snippet: 'Start Marker',
//       ),
//       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//     ));
//
//     markers.add(Marker(
//       //add distination location marker
//       markerId: MarkerId(endLocation.toString()),
//       position: endLocation, //position of marker
//       infoWindow: InfoWindow(
//         //popup info
//         title: 'Destination Point ',
//         snippet: 'Destination Marker',
//       ),
//       icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//     ));
//
//     getDirections(); //fetch direction polylines from Google API
//
//     super.initState();
//   }
//
//   getDirections() async {
//     List<LatLng> polylineCoordinates = [];
//
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPiKey,
//       PointLatLng(startLocation.latitude, startLocation.longitude),
//       PointLatLng(endLocation.latitude, endLocation.longitude),
//       travelMode: TravelMode.driving,
//     );
//
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result.errorMessage);
//     }
//     addPolyLine(polylineCoordinates);
//   }
//
//   addPolyLine(List<LatLng> polylineCoordinates) {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.deepPurpleAccent,
//       points: polylineCoordinates,
//       width: 8,
//     );
//     polylines[id] = polyline;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Center(child: Text("Order Tracking")),
//         backgroundColor: Colors.deepPurpleAccent,
//       ),
//       body: GoogleMap(
//         compassEnabled: true,
//
//         myLocationButtonEnabled: true,
//         //Map widget from google_maps_flutter package
//         zoomGesturesEnabled: true,
//         //enable Zoom in, out on map
//         initialCameraPosition: CameraPosition(
//           //innital position in map
//           target: startLocation, //initial position
//           zoom: 16.0, //initial zoom level
//         ),
//         markers: markers,
//         //markers to show on map
//         polylines: Set<Polyline>.of(polylines.values),
//         //polylines
//         mapType: MapType.normal,
//         //map type
//         onMapCreated: (controller) {
//           //method called when map is created
//           setState(() {
//             mapController =  controller;
//           });
//         },
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 56.0),
//         child: FloatingActionButton(
//           backgroundColor: Colors.white,
//           onPressed: _goToCurrentLocation,
//           // label: const Text(""),
//           child: Icon(
//             Icons.center_focus_strong_rounded,
//             color: Colors.black38,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _goToCurrentLocation() async {
//     await _determinePosition();
//
//     final GoogleMapController controller = await mapController;
//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: startLocation, zoom: 15),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => OrderTrackingScreenState();
}

class OrderTrackingScreenState extends State<OrderTrackingScreen> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: OrderTracker(
            status: Status.delivered,
            activeColor: Colors.green,
            inActiveColor: Colors.grey[300],
            orderTitleAndDateList: orderList,
            shippedTitleAndDateList: shippedList,
            outOfDeliveryTitleAndDateList: outOfDeliveryList,
            deliveredTitleAndDateList: deliveredList,
          ),
        ),
      ),
    );
  }
}
