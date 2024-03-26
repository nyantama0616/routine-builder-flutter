import "package:routine_builder/feature/water/class/WaterController.dart";
import "package:routine_builder/general/class/water_amount.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:async';
import 'package:routine_builder/general/query/client/water_query_client.dart';

WaterController useWater() {
  final _waterAmount = useState<WaterAmount>(WaterAmount.init());
  final _drinkable = useState<bool>(true);
  Timer? _timer;
  final _waterQueryClient = WaterQueryClient();

  void init() {
    _waterQueryClient.init().then((res) {
      _waterAmount.value = res.amount;
    }).catchError((e) {
      print(e);
    });
  }

  void drinkWater200() {
    if (!_drinkable.value) return;
    _waterQueryClient.drinkWater(200).then((res) {
      print(res.amount.water);
      _waterAmount.value = res.amount;

      // 2秒間は連続で飲めないようにする
      _drinkable.value = false;
      _timer = Timer(Duration(seconds: 2), () {
        _drinkable.value = true;
      });
    }).catchError((e) {
      print(e);
    });
  }

  useEffect(() {
    init();
    return () {
      _timer?.cancel();
    };
  }, []);

  return useMemoized(
      () => WaterController(
            waterAmount: _waterAmount.value,
            drinkWater200: drinkWater200,
            drinkable: _drinkable.value,
          ),
      [_waterAmount.value]);
}
