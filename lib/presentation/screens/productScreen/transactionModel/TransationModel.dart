// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
  final String? status;
  final int? currentPage;
  final int? totalPages;
  final List<Transaction>? transactions;

  TransactionModel({
    this.status,
    this.currentPage,
    this.totalPages,
    this.transactions,
  });

  TransactionModel copyWith({
    String? status,
    int? currentPage,
    int? totalPages,
    List<Transaction>? transactions,
  }) =>
      TransactionModel(
        status: status ?? this.status,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        transactions: transactions ?? this.transactions,
      );

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    status: json["status"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    transactions: json["transactions"] == null ? [] : List<Transaction>.from(json["transactions"]!.map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "current_page": currentPage,
    "total_pages": totalPages,
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toJson())),
  };
}

class Transaction {
  final String? transactionId;
  final int? amount;
  final String? status;
  final String? transactionTime;
  final DateTime? transactionDate;
  final String? orderId;
  final String? paymentMethod;

  Transaction({
    this.transactionId,
    this.amount,
    this.status,
    this.transactionTime,
    this.transactionDate,
    this.orderId,
    this.paymentMethod,
  });

  Transaction copyWith({
    String? transactionId,
    int? amount,
    String? status,
    String? transactionTime,
    DateTime? transactionDate,
    String? orderId,
    String? paymentMethod,
  }) =>
      Transaction(
        transactionId: transactionId ?? this.transactionId,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        transactionTime: transactionTime ?? this.transactionTime,
        transactionDate: transactionDate ?? this.transactionDate,
        orderId: orderId ?? this.orderId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    transactionId: json["transaction_id"],
    amount: json["amount"],
    status: json["status"],
    transactionTime: json["transaction_time"],
    transactionDate: json["transaction_date"] == null ? null : DateTime.parse(json["transaction_date"]),
    orderId: json["order_id"],
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "transaction_id": transactionId,
    "amount": amount,
    "status": status,
    "transaction_time": transactionTime,
    "transaction_date": "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
    "order_id": orderId,
    "payment_method": paymentMethod,
  };
}
