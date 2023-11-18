import '../models/models_index.dart';
import '../tools/tools_index.dart';

class CategoryService {
  static List<Category> categoryData =
      categoryRawData.map((data) => Category.fromJson(data)).toList();
}

var categoryRawData = [
  {
    'featured': true,
    'icon_url': Utils.assets('icons/Discount.svg'),
    'name': 'best offer',
  },
  {
    'featured': false,
    'icon_url': Utils.assets('icons/High-heels.svg'),
    'name': 'woman shoes',
  },
  {
    'featured': false,
    'icon_url': Utils.assets('icons/Woman-dress.svg'),
    'name': 'woman dress',
  },
  {
    'featured': false,
    'icon_url': Utils.assets('icons/Man-Clothes.svg'),
    'name': 'man clothes',
  },
  {
    'featured': false,
    'icon_url': Utils.assets('icons/Man-Pants.svg'),
    'name': 'man pants',
  },
  {
    'featured': false,
    'icon_url': Utils.assets('icons/Man-Shoes.svg'),
    'name': 'man shoes',
  },
];
