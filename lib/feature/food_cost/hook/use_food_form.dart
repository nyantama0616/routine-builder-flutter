import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/class/food/food_form_controller.dart';
import 'package:routine_builder/general/class/food.dart';

FoodFormController useFoodForm(Food initFood) {
  final _initMap = {
    "name": "",
    "abbName": "",
    "price": "",
  };
  
  final _map = useState<Map<String, String>>(_initMap);

  void handleOnChanged(String key, String value) {
    _map.value[key] = value;
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

  void init(Food food) {
    _map.value = {
      "name": food.name,
      "abbName": food.abbName ?? "",
      "price": food.price.toString(),
    };
  }

  return useMemoized(() {
    return FoodFormController(
      map: _map.value,
      onChanged: handleOnChanged,
      getFoodAndValidate: getFoodAndValidate,
      init: init,
    );
  }, [_map.value]);
}
