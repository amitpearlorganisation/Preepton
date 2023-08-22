part of 'get_cart_cubit.dart';

abstract class GetCartState extends Equatable {
  const GetCartState();
  @override
  List<Object> get props => [];
}

class GetCartLoading extends GetCartState {}
class GetCartLoaded extends GetCartState {
  final List<GetCartData> getCartData;

  GetCartLoaded(this.getCartData);

  @override
  List<Object> get props => [getCartData];
}
class GetCartErrorState extends GetCartState{
  final String errorMessage;

  GetCartErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


