import '../helper/helper_index.dart';

class Category {
  const Category(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final homeCategries = <Category>[
  Category(Utils.assets('icons/category_sofa@2x.png'), 'Sofa', 'sofa'),
  Category(Utils.assets('icons/category_chair@2x.png'), 'Chair', 'sofa'),
  Category(Utils.assets('icons/category_table@2x.png'), 'Table', 'sofa'),
  Category(Utils.assets('icons/category_kitchen@2x.png'), 'Kitchen', 'sofa'),
  Category(Utils.assets('icons/category_lamp@2x.png'), 'Lamp', 'sofa'),
  Category(Utils.assets('icons/category_cupboard@2x.png'), 'Cupboard', 'sofa'),
  Category(Utils.assets('icons/category_vase@2x.png'), 'Vase', 'sofa'),
  Category(Utils.assets('icons/category_others@2x.png'), 'Others', 'sofa'),
];
