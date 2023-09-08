part of 'transation_bloc.dart';

abstract class TransationEvent extends Equatable {
  const TransationEvent();
}
class TransactionLoadedEvent extends TransationEvent{
  String mobileNo;
  String pageNo;
  TransactionLoadedEvent({required  this.mobileNo, required  this.pageNo});
  @override
  List<Object?> get props =>[];

}