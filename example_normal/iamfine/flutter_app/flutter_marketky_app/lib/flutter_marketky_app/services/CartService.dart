import '../models/models_index.dart';
import '../tools/tools_index.dart';

class CartService {
  static List<Cart> cartData =
      cartRawData.map((data) => Cart.fromJson(data)).toList();
}

var cartRawData = [
  {
    'image': [
      Utils.assets('images/nikeblack.jpg'),
      Utils.assets('images/nikegrey.jpg'),
    ],
    'name': 'Nike Waffle One',
    'price': 1429000,
    'count': 1,
  },
  // 2
  {
    'image': [
      Utils.assets('images/nikegrey.jpg'),
      Utils.assets('images/nikeblack.jpg'),
    ],
    'name': "Nike Blazer Mid77 Vintage",
    'price': 1429000,
    'count': 1,
  },
  // 3
  {
    'image': [
      Utils.assets('images/nikehoodie.jpg'),
      Utils.assets('images/nikehoodie.jpg'),
    ],
    'name': "Nike Sportswear Swoosh",
    'price': 849000,
    'count': 1,
  },
];
