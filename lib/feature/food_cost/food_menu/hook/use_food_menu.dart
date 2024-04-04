import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_detail_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_edit_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menus_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food_menu/hook/use_food_menu_form.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';

FoodMenuController useFoodMenu() {
  final _scene = useState(Scenes.foodMenuDetail);
  final title = _titleFromScene(_scene.value);
  final _selectedFoodMenu = useState<FoodMenu>(FoodMenu.initDev(0));
  final _formController = useFoodMenuForm(foods: [
    Food.initDev(0),
    Food.initDev(1),
    Food.initDev(2),
  ]);

  void handleTapBackButton() {
    print("tapped back button");
  }

  //FoodMenus

  final foodMenus = useState<List<FoodMenuHeader>>([
    FoodMenuHeader.initDev(0),
    FoodMenuHeader.initDev(1),
    FoodMenuHeader.initDev(2),
  ]);

  void handleTapFoodMenuItem(FoodMenuHeader foodMenu) {
    // _selectedFoodMenu.value;
    print("tapped food menu: ${foodMenu.name}");
  }

  void handleTapAddFoodMenuButton() {
    print("tapped add food menu button");
  }

  final foodMenusController = FoodMenusController(
    foodMenus: foodMenus.value,
    handleTapFoodMenuItem: handleTapFoodMenuItem,
    handleTapAddFoodMenuButton: handleTapAddFoodMenuButton,
  );

  //FoodMenuDetail

  void handleTapEditButton() {
    _formController.init(_selectedFoodMenu.value);
    _scene.value = Scenes.foodMenuEdit;
  }

  final foodMenuDetailController = FoodMenuDetailController(
    foodMenu: _selectedFoodMenu.value,
    handleTapEditButton: handleTapEditButton,
  );

  //FoodMenuEdit

  void handleTapSaveButton() {
    print("tapped save button");
    _scene.value = Scenes.foodMenuDetail;
  }

  void handleTapDeleteButton() {
    print("tapped delete button");
  }

  final foodMenuEditController = FoodMenuEditController(
    foodMenu: _selectedFoodMenu.value,
    handleTapSaveButton: handleTapSaveButton,
    handleTapDeleteButton: handleTapDeleteButton,
    formController: _formController,
  );

  return useMemoized(() {
    return FoodMenuController(
      scene: _scene.value,
      title: title,
      handleTapBackButton: handleTapBackButton,
      foodMenusController: foodMenusController,
      foodMenuDetailController: foodMenuDetailController,
      foodMenuEditController: foodMenuEditController,
    );
  }, [_scene.value, _selectedFoodMenu.value, _formController, foodMenus.value]);
}

String _titleFromScene(Scenes scene) {
  switch (scene) {
    case Scenes.foodMenus:
      return "FoodMenus";
    case Scenes.foodMenuDetail:
      return "FoodMenuDetail";
    default:
      return "FoodMenus";
  }
}
