import 'package:fooddeliveryandecommerceapp/model/chinese_model.dart';

List<ChineseModel> getChinese() {
  List<ChineseModel> chinese = [];
  ChineseModel chineseModel = new ChineseModel();

  chineseModel.name = "Cheese burger";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "10.99";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Margherita burger";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "12.99";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Cheese burger";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "10.99";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  chineseModel.name = "Margherita burger";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "12.99";
  chinese.add(chineseModel);
  chineseModel = new ChineseModel();

  return chinese;
}
