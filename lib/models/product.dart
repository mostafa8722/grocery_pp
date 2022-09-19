
import 'package:grocery_pp/models/category.dart';

class Product {
String name,description;
Category category;
int calorie;
List<String> images;
double price , rate;

Product({
  required this.name,
  required this.description,
  required this.category,
  required this.calorie,
  required this.images,
  required this.rate,
  required this.price,
});
}