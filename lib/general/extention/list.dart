import 'dart:math';

extension ListAnyExtension<T> on List<T> {
  T pick() {
    Random random = Random();
    return this[random.nextInt(length)];
  }

  int binarySearch(T value) {
    int low = 0;
    int high = length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      T midValue = this[mid];

      if (midValue == value) {
        return mid;
      } else if (midValue.hashCode < value.hashCode) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return -1; // 値が見つからなかった場合
  }
}
