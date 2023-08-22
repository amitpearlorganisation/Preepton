import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../core/models/cart.model.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit() : super(GetCartLoading());
}
