part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  final List<ProductModels> productModel;

  ProductLoadedState(this.productModel);

  @override
  List<Object> get props => [productModel];

}
class ProductErrorState extends ProductState{
  final String errorMessage;

  ProductErrorState(this.errorMessage);
}