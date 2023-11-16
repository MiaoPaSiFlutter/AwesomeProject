import '../models/models_index.dart';
import '../tools/tools_index.dart';

class ExploreService {
  static List<ExploreItem> listExploreItem =
      listExploreItemRawData.map((data) => ExploreItem.fromJson(data)).toList();
  static List<ExploreUpdate> listExploreUpdateItem =
      listExploreUpdateItemRawData
          .map((data) => ExploreUpdate.fromJson(data))
          .toList();
}

var listExploreItemRawData = [
  {'image_url': Utils.assets('images/explore1.jpg')},
  {'image_url': Utils.assets('images/explore2.jpg')},
  {'image_url': Utils.assets('images/explore3.jpg')},
  {'image_url': Utils.assets('images/explore4.jpg')},
  {'image_url': Utils.assets('images/explore5.jpg')},
  {'image_url': Utils.assets('images/explore6.jpg')},
  {'image_url': Utils.assets('images/explore7.jpg')},
  {'image_url': Utils.assets('images/explore8.jpg')},
  {'image_url': Utils.assets('images/explore9.jpg')},
  {'image_url': Utils.assets('images/explore10.jpg')},
  {'image_url': Utils.assets('images/explore11.jpg')},
  {'image_url': Utils.assets('images/explore12.jpg')},
  {'image_url': Utils.assets('images/explore13.jpg')},
  {'image_url': Utils.assets('images/explore14.jpg')},
  {'image_url': Utils.assets('images/explore15.jpg')},
  {'image_url': Utils.assets('images/explore16.jpg')},
];

var listExploreUpdateItemRawData = [
  {
    'logo_url': Utils.assets('images/zaralogo.jpg'),
    'image': Utils.assets('images/update1.jpg'),
    'store_name': 'Zara Indonesia',
    'caption':
        'The jacket is quite soft on the inside. Rib hem collar. Long sleeves, elastic cuffs. Various paspoil pockets on the hips and pocket details on the inside.',
  },
  {
    'logo_url': Utils.assets('images/nikelogo.jpg'),
    'image': Utils.assets('images/update2.jpg'),
    'store_name': 'Nike Indonesia',
    'caption':
        'Suit up like the pros in the Brooklyn Nets City Edition Swingman Shorts. Made from smooth, lightweight fabric with sweat-wicking technology, they have authentic team colours and details that match what the players wear during games. This product is made from 100% recycled polyester fibres.',
  },
];
