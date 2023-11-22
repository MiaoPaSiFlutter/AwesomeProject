import 'dart:io';

import 'package:chat/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cache/local_cache.dart';
import '../../data/services/image_uploader.dart';
import '../../states_management/onboarding/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final IUserService _userService;
  final ImageUploader _imageUploader;
  final ILocalCache _localCache;
  OnboardingCubit(this._userService, this._imageUploader, this._localCache)
      : super(OnboardingInitial());

  Future<void> connect(String name, File profileImage) async {
    emit(Loading());
    final url = await _imageUploader.uploadImage(profileImage);
    final user = User(
      id: name,
      userName: name,
      photoUrl: url,
      active: true,
      lastSeen: DateTime.now(),
    );

    final createdUser = await _userService.connect(user);
    final userJson = createdUser.toJson();
    await _localCache.save('USER', userJson);
    emit(OnboardingSuccess(createdUser));
  }
}
