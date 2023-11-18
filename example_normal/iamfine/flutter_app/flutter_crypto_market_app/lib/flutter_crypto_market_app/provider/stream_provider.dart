import 'package:flutter/cupertino.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

import '../models/models_index.dart';
import 'api_service.dart';

class StreamsProvider with ChangeNotifier {
  Stream<List<CryptoDataModel>> cryptoDataStream(context) async* {
    List<CryptoDataModel> list = [];
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      list = await Provider.of<APIServiceProvider>(context, listen: false)
          .getCryptoData();
      notifyListeners();
      yield list;
    }
  }
}
