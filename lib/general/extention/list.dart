import 'dart:math';

extension ListAnyExtension<T> on List<T> {
  T pick() {
    Random random = Random();
    return this[random.nextInt(length)];
  }
}
