import 'package:routine_builder/general/enum/places.dart';

class StartRequestBody {
  final Places from;
  final Places to;

  StartRequestBody(this.from, this.to);

  Map<String, dynamic> toJson() {
    return {
      'from': from.rawValue,
      'to': to.rawValue,
    };
  }
}
