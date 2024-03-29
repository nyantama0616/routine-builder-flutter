// import 'package:routine_builder/feature/hanon/settings.dart';

typedef HanonPatterns = Map<int, Map<String, int>>;

HanonPatterns hanonPatternsFromJson(Map<String, dynamic> json) {
  HanonPatterns patterns = {};
  for (int i = 1; i <= json.length; i++) {
    patterns[i] = Map<String, int>.from(json[i.toString()]);
  }
  return patterns;
}
