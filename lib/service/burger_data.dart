import 'package:fooddeliveryandecommerceapp/model/burger_model.dart';

List<BurgerModel> getBurger() {
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = new BurgerModel();

  burgerModel.name = "Cheese burger";
  burgerModel.image = "images/burger1.png";
  burgerModel.price = "10.99";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Margherita burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "12.99";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Cheese burger";
  burgerModel.image = "images/burger1.png";
  burgerModel.price = "10.99";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  burgerModel.name = "Margherita burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "12.99";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  return burger;
}
