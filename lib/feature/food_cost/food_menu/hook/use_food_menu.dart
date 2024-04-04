import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_create_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_detail_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menu_edit_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/controller/food_menus_controller.dart';
import 'package:routine_builder/feature/food_cost/food_menu/enum/scenes.dart';
import 'package:routine_builder/feature/food_cost/food_menu/hook/use_food_menu_form.dart';
import 'package:routine_builder/general/model/food.dart';
import 'package:routine_builder/general/model/food_menu.dart';
import 'package:routine_builder/general/query/client/food_cost_query_client.dart';

FoodMenuController useFoodMenu() {
  final _scene = useState(Scenes.foodMenus);
  final title = _titleFromScene(_scene.value);
  final _selectedFoodMenu = useState<FoodMenu>(FoodMenu.initDev(0));
  final _foods =
      useState<List<Food>>([]); //TOOO: providerで管理しようか...ひとつ上の階層で管理しようか...
  final _foodMenus =
      useState<List<FoodMenu>>([]); //TOOO: providerで管理しようか...ひとつ上の階層で管理しようか...
  final _formController = useFoodMenuForm(foods: _foods.value);
  final client = FoodCostQueryClient();

  void handleTapBackButton() {
    print("tapped back button");
  }

  void _init() {
    client.initFood().then((response) {
      _foods.value = response.foods;
    }).catchError((error) {
      print("$error from initFood");
    });

    client.initFoodMenu().then((res) {
      _foodMenus.value = res.foodMenus;
    }).catchError((error) {
      print("$error from initFoodMenu");
    });
  }

  //FoodMenus

  void handleTapFoodMenuItem(FoodMenu foodMenu) {
    _selectedFoodMenu.value = foodMenu;
    _scene.value = Scenes.foodMenuDetail;
  }

  void handleTapAddFoodMenuButton() {
    _formController.init(FoodMenu.init());
    _scene.value = Scenes.foodMenuCreate;
  }

  final foodMenusController = FoodMenusController(
    foodMenus: _foodMenus.value,
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

  //FoodMenuCreate

  void handleTapSaveCreateButton() {
    final foodMenuAndValid = _formController.getFoodMenuAndValidate();
    final name = foodMenuAndValid.foodMenu.name;
    final foods = foodMenuAndValid.foodMenu.foods
        .map((e) => e.toFoodIdWithQuantity())
        .toList();

    if (!foodMenuAndValid.isValid) {
      return;
    }

    client.createFoodMenu(name, foods).then((res) {
      _init();
      _selectedFoodMenu.value = res.foodMenu;
      _scene.value = Scenes.foodMenuDetail;
    }).catchError((error) {
      print("$error from createFoodMenu");
    });
  }

  final foodMenuCreateController = FoodMenuCreateController(
    handleTapSaveButton: handleTapSaveCreateButton,
    formController: _formController,
  );

  useEffect(() {
    _init();
    return null;
  }, []);

  return useMemoized(() {
    return FoodMenuController(
      scene: _scene.value,
      title: title,
      handleTapBackButton: handleTapBackButton,
      foodMenusController: foodMenusController,
      foodMenuDetailController: foodMenuDetailController,
      foodMenuEditController: foodMenuEditController,
      foodMenuCreateController: foodMenuCreateController,
    );
  }, [
    _scene.value,
    _selectedFoodMenu.value,
    _formController,
    _foodMenus.value
  ]);
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
