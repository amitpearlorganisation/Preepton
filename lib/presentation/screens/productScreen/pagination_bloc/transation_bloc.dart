import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/Repository/produt_repo.dart';
import '../transactionModel/TransationModel.dart';

part 'transation_event.dart';
part 'transation_state.dart';

class TransationBloc extends Bloc<TransactionLoadedEvent, TransationState> {
  final TransactionRepo transactionRepo;
  TransationBloc(this.transactionRepo) : super(TransactionLoadingState()) {
    on<TransactionLoadedEvent>((event, emit) async {
      try{
        final data = await transactionRepo.getTransactions("1234567891", event.pageNo??"1");
        emit(TransactionLoadedState(data as List<TransactionModel>));
      }
      catch  (e){
        emit(TransactionErrorState(e.toString()));
      }    });
  }
}
