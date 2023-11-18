import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models_model.dart';
import '../providers/models_provider.dart';

class ModelDropDown extends StatefulWidget {
  const ModelDropDown({Key? key}) : super(key: key);

  @override
  State<ModelDropDown> createState() => _ModelDropDownState();
}

class _ModelDropDownState extends State<ModelDropDown> {
  String? currentChosen;
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelsProvider>(builder: (context, provider, _) {
      return FutureBuilder<List<Data>>(
          future: provider.getModels(context),
          builder: (context, models) {
            if (!models.hasData) {
              return const SizedBox.shrink();
            } else if (models.hasError) {
              return const Text("Something went wrong");
            } else {
              currentChosen = provider.currentModel;
              return DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: currentChosen,
                    items: models.data!
                        .map((modelList) => DropdownMenuItem(
                            value: modelList.id,
                            child: Text(modelList.id.toString())))
                        .toList(),
                    onChanged: (val) {
                      provider.setCurrentModel(val.toString());
                    }),
              );
            }
          });
    });
  }
}
