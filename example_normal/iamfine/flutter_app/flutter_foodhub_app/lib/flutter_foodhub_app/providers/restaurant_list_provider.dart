import 'package:flutter/widgets.dart';
import 'package:flutter_foodhub_app/flutter_foodhub_app.dart';

import 'response_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  RestaurantListProvider() {
    _getListRestaurant();
  }

  RestaurantListResponse? _restaurantList;
  ResponseState? _responseState;
  late String _message = '';

  RestaurantListResponse? get restaurantList => _restaurantList;
  ResponseState? get state => _responseState;
  String get message => _message;
  dynamic get refreshData => _getListRestaurant();

  Future<dynamic> _getListRestaurant() async {
    try {
      _responseState = ResponseState.loading;
      notifyListeners();

      RestaurantListResponse restaurantList =
          await ApiRestaurant.getRestaurantList();
      if (restaurantList.restaurants.isEmpty) {
        _responseState = ResponseState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _responseState = ResponseState.hasData;
        notifyListeners();
        return _restaurantList = restaurantList;
      }
    } catch (e) {
      _responseState = ResponseState.error;
      notifyListeners();
      return _message = 'Failed to get Data, Please check your connectivity';
    }
  }
}
