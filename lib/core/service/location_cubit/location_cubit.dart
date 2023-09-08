import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

import '../location_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService locationService;

  LocationCubit(this.locationService) : super(LocationInitial());

  onLocationList() async{
    try {
      emit(LocationLoading());
      var location = await locationService.getLocation();
      print("=====object$location");
      // Check if the location is a string (formatted address) or an object (LocationModel)
      List<String> parts = location.split(', ');

      // Now, 'parts' contains all the address components separated by commas

      // You can access the individual parts or store them in variables
      String part1 = parts.isNotEmpty ? parts[0] : '';
      String streat = parts.length > 1 ? parts[1] : '';
      String part3 = parts.length > 2 ? parts[2] : '';
      String city = parts.length > 3 ? parts[3] : '';
      String part5 = parts.length > 4 ? parts[4] : '';
      print(streat );
      print(city);
      if (streat !="") {
        emit(LocationLoaded(city: city,country: "",landmark:streat,pincode: "123456"));
      } else {
        // Handle the case where it's not a string (you can emit an error state)
        emit(LocationErrorState('Invalid location data'));
      }
    } catch (e) {
      emit(LocationErrorState(e.toString()));
    }
  }
  }


