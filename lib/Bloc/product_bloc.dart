import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../app/Repository/produt_repo.dart';
import '../app/models/product_models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState> {
  final ProductsRepo productsRepo;
  ProductBloc(this.productsRepo) : super(ProductLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async{
      try{
        final data = await productsRepo.getProducts();
        emit(ProductLoadedState(data));
      }
      catch  (e){
         emit(ProductErrorState(e.toString()));
      }
    });
  }
}
