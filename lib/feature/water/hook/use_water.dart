import "package:routine_builder/feature/water/class/WaterController.dart";
import "package:routine_builder/general/class/water_amount.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:async';

WaterController useWater() {
  final _waterAmount = useState<WaterAmount>(WaterAmount.init());
  final _drinkable = useState<bool>(true);
  Timer? _timer;

  void drinkWater200() {
    if (!_drinkable.value) return;
    _waterAmount.value = _waterAmount.value.copyWith(water: _waterAmount.value.water + 200);

    // 2秒間は連続で飲めないようにする
    _drinkable.value = false;
    _timer = Timer(Duration(seconds: 2), () {
      _drinkable.value = true;
    });
  }

  useEffect(() {
    return () {
      _timer?.cancel();
    };
  }, []);

  return useMemoized(() => WaterController(
    waterAmount: _waterAmount.value,
    drinkWater200: drinkWater200,
    drinkable: _drinkable.value,
  ), [_waterAmount.value]);
}
