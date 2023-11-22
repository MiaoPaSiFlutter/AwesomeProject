import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageCubit extends Cubit<File?> {
  final _picker = ImagePicker();
  ProfileImageCubit() : super(null);

  Future<void> getImage() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    print('image = ${image}');
    if (image == null) return;
    emit(File(image.path));
  }
}
