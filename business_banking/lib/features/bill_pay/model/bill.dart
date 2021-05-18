import 'package:equatable/equatable.dart';

class Bill extends Equatable {
  final int id;
  final String payee;
  final String memo;
  final double amount;
  final DateTime due;

  Bill.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        payee = json['payee'] ?? 'Unknown',
        memo = json['memo'] ?? '',
        amount = (json['amount'] != null) ? json['amount'] * 1.0 : 0.0,
        due = DateTime.fromMillisecondsSinceEpoch(json['due']
            ?? DateTime.now().millisecondsSinceEpoch);

  @override
  List<Object> get props => [id, payee, memo, amount, due];
}
