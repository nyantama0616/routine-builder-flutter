import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food-cost/class/food_form_controller.dart';
import 'package:routine_builder/general/class/food.dart';

FoodFormController useFoodForm(Food initFood) {
  final _initMap = {
    "name": initFood.name,
    "abbName": initFood.abbName ?? "",
    "price": initFood.price.toString(),
  };
  
  final _map = useState<Map<String, String>>(_initMap);

  void handleOnChanged(String key, String value) {
    _map.value[key] = value;
    print(_map.value);
  }

  FoodAndValid getFoodAndValidate() {
    double price;
    bool isValid = true;

    try {
      price = double.parse(_map.value["price"]!);
    } catch (e) {
      price = -1;
      isValid = false;
    }

    final food = Food(
      id: initFood.id,
      name: _map.value["name"]!,
      abbName: _map.value["abbName"]!,
      price: price,
    );

    return FoodAndValid(food, isValid);
  }

  void reset() {
    _map.value = _initMap;
  }

  return useMemoized(() {
    return FoodFormController(
      map: _map.value,
      onChanged: handleOnChanged,
      getFoodAndValidate: getFoodAndValidate,
      reset: reset,
    );
  }, [_map.value]);
}
