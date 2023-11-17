import 'package:flutter/cupertino.dart';
import '../api_services/api_call.dart';
import '../models/models_model.dart';

class ModelsProvider with ChangeNotifier {
  List<Data> jsonResponseList = [];
  String currentModel = "text-davinci-003";

  setCurrentModel(String model) {
    currentModel = model;
    notifyListeners();
  }

  Future<List<Data>> getModels(context) async {
    jsonResponseList = await APICall.getModels(context);
    return jsonResponseList;
  }
}
