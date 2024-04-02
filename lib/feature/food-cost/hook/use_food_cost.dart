import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food-cost/class/food_cost_controller.dart';
import 'package:routine_builder/feature/food-cost/class/food_create_controller.dart';
import 'package:routine_builder/feature/food-cost/class/food_detail_controller.dart';
import 'package:routine_builder/feature/food-cost/class/food_edit_controller.dart';
import 'package:routine_builder/feature/food-cost/class/foods_controller.dart';
import 'package:routine_builder/feature/food-cost/enum/scenes.dart';
import 'package:routine_builder/general/class/food.dart';

FoodCostController useFoodCost() {
  final _foods = useState<List<Food>>([
    Food.init(0),
    Food.init(1),
    Food.init(2),
  ]);
  final _scene = useState<Scenes>(Scenes.foods);
  final _title = _titleFromScene(_scene.value);
  final _selectedFood = useState<Food>(Food.init(0));

  void handleTapBackButton() {
    // TODO: 実装
    _scene.value = Scenes.foods;
  }

  // foods

  void handleTapAddFoodButton() {
    _scene.value = Scenes.foodCreate;
  }

  void handleTapFoodItem(Food food) {
    _scene.value = Scenes.foodDetail;
    print("tapped food: ${food.name}");
  }

  final foodsController = FoodsController(
    foods: _foods.value,
    handleTapFoodItem: handleTapFoodItem,
    handleTapAddFoodButton: handleTapAddFoodButton,
  );

  // foodDetail
  
  void handleTapEditButton() {
    _scene.value = Scenes.foodEdit;
  }

  final foodDetailController = FoodDetailController(
    food: _selectedFood.value,
    handleTapEditButton: handleTapEditButton,
  );

  // foodEdit

  void handleTapSaveEditButton() {
    _scene.value = Scenes.foodDetail;
  }

  final foodEditController = FoodEditController(
    food: _selectedFood.value,
    handleTapSaveButton: handleTapSaveEditButton,
  );

  // foodCreate

  void handleTapSaveCreateButton() {
    _scene.value = Scenes.foods;
  }

  final foodCreateController = FoodCreateController(
    handleTapSaveButton: handleTapSaveCreateButton,
  );

  return useMemoized(() {
    return FoodCostController(
      scene: _scene.value,
      title: _title,
      handleTapBackButton: handleTapBackButton,
      foodsController: foodsController,
      foodDetailController: foodDetailController,
      foodEditController: foodEditController,
      foodCreateController: foodCreateController,
    );
  }, [_scene.value, _foods.value]);
}

String _titleFromScene(Scenes scene) {
  switch (scene) {
    case Scenes.foods:
      return '食品一覧';
    case Scenes.foodDetail:
      return '食品詳細';
    case Scenes.foodCreate:
      return '食品追加';
    default:
      return '食品一覧';
  }
}