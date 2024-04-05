import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_form_controller.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';

FoodMenuFormController useFoodMenuForm({required List<Food> foods}) {
  final _foodMenu = useState<FoodMenu>(FoodMenu.init());
  final _showFoodList = useState<bool>(false);
  final _map = useState<Map<String, String>>({});
  final disabledFoodIds = useMemoized(() {
    final ids = _foodMenu.value.foods.map((e) => e.food.id).toList();
    ids.sort();
    return ids;
  }, [_foodMenu.value.foods]);

  void handleTapAddButton() {
    _showFoodList.value = true;
  }

  void handleTapCrossButton() {
    _showFoodList.value = false;
  }

  void handleChange(String key, String value) {
    _map.value[key] = value;
  }

  void handleQuantityChange(int foodId, String value) {
    final index = _foodMenu.value.foods
        .indexWhere((element) => element.food.id == foodId);
    _foodMenu.value.foods[index] =
        _foodMenu.value.foods[index].copyWith(quantity: double.parse(value));
  }

  void handleAddFood(FoodWithQuantity foodWithQuantity) {
    _foodMenu.value = _foodMenu.value.copyWith(
      foods: [..._foodMenu.value.foods, foodWithQuantity],
    );
  }

  void handleRemoveFood(FoodWithQuantity foodWithQuantity) {
    _foodMenu.value = _foodMenu.value.copyWith(
      foods: _foodMenu.value.foods
          .where((element) => element.food.id != foodWithQuantity.food.id)
          .toList(),
    );
  }

  void handleEditFood(FoodWithQuantity foodWithQuantity) {
    final index = _foodMenu.value.foods.indexWhere((element) =>
        element.food.id == foodWithQuantity.food.id); //TODO: ２分法にする
    _foodMenu.value.foods[index] = foodWithQuantity;
  }

  FoodMenuAndValid getFoodMenuAndValidate() {
    final foodMenu = _foodMenu.value.copyWith(
      name: _map.value['name'] ?? '',
    );
    return FoodMenuAndValid(foodMenu, true);
  }

  void init(FoodMenu foodMenu) {
    _map.value = {
      'name': foodMenu.name,
    };
    _foodMenu.value = foodMenu.copyWith();
  }

  return useMemoized(() {
    return FoodMenuFormController(
      foodMenu: _foodMenu.value,
      map: _map.value,
      foods: foods,
      disabledIds: disabledFoodIds,
      showFoodList: _showFoodList.value,
      handleTapAddButton: handleTapAddButton,
      handleTapCrossButton: handleTapCrossButton,
      handleChange: handleChange,
      handleAddFood: handleAddFood,
      handleRemoveFood: handleRemoveFood,
      handleEditFood: handleEditFood,
      getFoodMenuAndValidate: getFoodMenuAndValidate,
      init: init,
    );
  }, [
    _foodMenu.value,
    _showFoodList.value,
    _map.value,
    foods,
  ]);
}
