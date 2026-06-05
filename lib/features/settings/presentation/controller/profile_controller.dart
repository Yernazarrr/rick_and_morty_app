import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/user_profile.dart';

/// Хранит редактируемый локальный профиль, сохраняемый в SharedPreferences.
/// Использует ChangeNotifier из `provider` (согласно требуемому стеку).
@lazySingleton
class ProfileController extends ChangeNotifier {
  ProfileController(this._prefs) {
    _load();
  }

  final SharedPreferences _prefs;
  UserProfile _profile = UserProfile.initial;

  UserProfile get profile => _profile;

  void _load() {
    _profile = UserProfile(
      name: _prefs.getString(AppConstants.prefProfileName) ??
          UserProfile.initial.name,
      nickname: _prefs.getString(AppConstants.prefProfileNickname) ??
          UserProfile.initial.nickname,
    );
  }

  Future<void> update({required String name, required String nickname}) async {
    _profile = UserProfile(name: name.trim(), nickname: nickname.trim());
    await _prefs.setString(AppConstants.prefProfileName, _profile.name);
    await _prefs.setString(AppConstants.prefProfileNickname, _profile.nickname);
    notifyListeners();
  }
}
