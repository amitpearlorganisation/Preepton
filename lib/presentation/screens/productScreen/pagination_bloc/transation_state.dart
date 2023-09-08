part of 'transation_bloc.dart';

abstract class TransationState extends Equatable {
  const TransationState();
  @override
  List<Object> get props => [];
}

class TransationInitial extends TransationState {
  @override
  List<Object> get props => [];
}
class TransactionLoadingState extends TransationState{
}
class TransactionLoadedState extends TransationState{
  final List<TransactionModel> transactionModel;

  TransactionLoadedState(this.transactionModel);

  @override
  List<Object> get props => [transactionModel];

}
class TransactionErrorState extends TransationState{
  final String errorMessage;

  TransactionErrorState(this.errorMessage);
}
