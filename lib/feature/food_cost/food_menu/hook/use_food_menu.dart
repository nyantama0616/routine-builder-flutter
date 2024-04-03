import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menus_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/enum/scenes.dart';
import 'package:routine_builder/general/model/food_menu.dart';

FoodMenuController useFoodMenu() {
  final scene = useState(Scenes.foodMenus);
  final title = "FoodMenus";

  void handleTapBackButton() {
    print("tapped back button");
  }

  //FoodMenus

  final foodMenus = useState<List<FoodMenu>>([
    FoodMenu.init(),
    FoodMenu.init(),
    FoodMenu.init(),
  ]);

  void handleTapFoodMenuItem(FoodMenu foodMenu) {
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

  return useMemoized(() {
    return FoodMenuController(
      scene: scene.value,
      title: title,
      foodMenusController: foodMenusController,
      handleTapBackButton: handleTapBackButton,
    );
  });
}
