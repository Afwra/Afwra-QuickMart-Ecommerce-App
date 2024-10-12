import 'package:hive/hive.dart';
import 'package:quick_mart/core/utils/app_constants.dart';

void saveOnBoardingCompleted(bool completed) {
  var settingBox = Hive.box(AppConstants.settingsBox);
  settingBox.put(AppConstants.onboardingCompleted, completed);
}

bool getOnBoardingCompleted() {
  var settingBox = Hive.box(AppConstants.settingsBox);
  return settingBox.get(AppConstants.onboardingCompleted, defaultValue: false);
}

void saveLoginToken(String token) {
  var settingBox = Hive.box(AppConstants.settingsBox);
  settingBox.put(AppConstants.loginToken, token);
}

String? getLoginToken() {
  var settingBox = Hive.box(AppConstants.settingsBox);
  return settingBox.get(AppConstants.loginToken);
}

bool getDarkMode() {
  var settingBox = Hive.box(AppConstants.settingsBox);
  return settingBox.get(AppConstants.darkModeStatus, defaultValue: false);
}

void saveDarkMode(bool enabledDarkMode) {
  var settingBox = Hive.box(AppConstants.settingsBox);
  settingBox.put(AppConstants.darkModeStatus, enabledDarkMode);
}

String getLanguageCode() {
  var settingBox = Hive.box(AppConstants.settingsBox);
  return settingBox.get(AppConstants.languageCode, defaultValue: 'en');
}

void saveLanguageCode(String code) {
  var settingBox = Hive.box(AppConstants.settingsBox);
  settingBox.put(AppConstants.languageCode, code);
}
