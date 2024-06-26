import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food/controller/food_controller.dart';
import 'package:routine_builder/feature/food_cost/food/controller/food_create_controller.dart';
import 'package:routine_builder/feature/food_cost/food/controller/food_detail_controller.dart';
import 'package:routine_builder/feature/food_cost/food/controller/food_edit_controller.dart';
import 'package:routine_builder/feature/food_cost/food/controller/foods_controller.dart';
import 'package:routine_builder/feature/food_cost/food/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food/hook/use_food_form.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/query/client/food_cost_query_client.dart';

FoodController useFood() {
  final _foods = useState<List<Food>>([]);
  final _scene = useState<Scenes>(Scenes.foods);
  final _title = _titleFromScene(_scene.value);
  final _selectedFood = useState<Food>(Food.init(0));
  final formController = useFoodForm(_selectedFood.value);
  final client = FoodCostQueryClient();

  void handleTapBackButton() {
    // TODO: 実装
    _scene.value = _targetSceneFromScene(_scene.value);
  }

  // foods

  void handleTapAddFoodButton() {
    _scene.value = Scenes.foodCreate;
    formController.init(Food.init(0));
  }

  void handleTapFoodItem(Food food) {
    _scene.value = Scenes.foodDetail;
    _selectedFood.value = food;
    formController.init(food); //TODO: ほんとにこれ必要？
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
    final foodAndValid = formController.getFoodAndValidate();
    if (!foodAndValid.isValid) {
      return;
    }

    client.updateFood(foodAndValid.food).then((res) {
      final index =
          _foods.value.indexWhere((element) => element.id == res.food.id);
      _foods.value[index] = res.food;
      handleTapFoodItem(res.food);
    }).catchError((error) {
      print("$error from useFoodCost#handleTapSaveEditButton");
    });
  }

  final foodEditController = FoodEditController(
    food: _selectedFood.value,
    handleTapSaveButton: handleTapSaveEditButton,
    formController: formController,
  );

  // foodCreate

  void handleTapSaveCreateButton() {
    // _scene.value = Scenes.foods;
    final foodAndValid = formController.getFoodAndValidate();
    if (!foodAndValid.isValid) {
      return;
    }

    client.createFood(foodAndValid.food).then((res) {
      _foods.value.add(res.food);
      _scene.value = Scenes.foods;
    }).catchError((error) {
      print("$error from useFoodCost#handleTapSaveCreateButton");
    });
  }

  final foodCreateController = FoodCreateController(
    handleTapSaveButton: handleTapSaveCreateButton,
    formController: formController,
  );

  void _init() {
    client.initFood().then((res) {
      _foods.value = res.foods;
    }).catchError((error) {
      print("$error from useFoodCost#_init");
    });
  }

  useEffect(() {
    _init();
    return null;
  }, []);

  return useMemoized(() {
    return FoodController(
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

Scenes _targetSceneFromScene(Scenes scene) {
  switch (scene) {
    case Scenes.foods:
      return Scenes.home;
    case Scenes.foodDetail:
      return Scenes.foods;
    case Scenes.foodCreate:
      return Scenes.foods;
    case Scenes.foodEdit:
      return Scenes.foodDetail;
    default:
      return Scenes.home;
  }
}
