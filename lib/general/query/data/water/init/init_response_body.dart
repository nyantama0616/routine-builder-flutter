import "package:routine_builder/general/class/water_amount.dart";

class InitResponseBody {
  final WaterAmount amount;

  InitResponseBody({required this.amount});

  factory InitResponseBody.fromJson(Map<String, dynamic> json) {
    return InitResponseBody(
      amount: WaterAmount.fromJson(json['amount']),
    );
  }
}
