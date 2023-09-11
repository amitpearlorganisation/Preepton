// part of 'location_cubit.dart';
//
// abstract class LocationState extends Equatable {
//   const LocationState();
//   @override
//   List<Object?> get props => [];
// }
//
// class LocationInitial extends LocationState {}
// class LocationLoading extends LocationState{}
// class LocationLoaded extends LocationState {
//   final String? city;
//   final String? pincode;
//   final String? landmark;
//   final String? country;
//
//   LocationLoaded({
//     this.city,
//     this.pincode,
//     this.landmark,
//     this.country,
//   });
//
//   @override
//   List<Object?> get props => [city, pincode, landmark, country];
// }
// class LocationErrorState extends LocationState {
//   final String errorMessage;
//
//   const LocationErrorState(this.errorMessage);
//
//   @override
//   List<Object> get props => [errorMessage];
// }
