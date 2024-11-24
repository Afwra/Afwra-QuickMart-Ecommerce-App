import 'package:hive/hive.dart';
import 'package:quick_mart/core/utils/app_constants.dart';
import 'package:quick_mart/core/utils/app_settings.dart';

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
  AppSettings.userToken = token;
}

String? getLoginToken() {
  var settingBox = Hive.box(AppConstants.settingsBox);
  return settingBox.get(AppConstants.loginToken);
}

void deleteLoginToken() {
  var settingBox = Hive.box(AppConstants.settingsBox);
  settingBox.delete(AppConstants.loginToken);
  AppSettings.userToken = null;
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

void saveSearchHistory(String term) {
  var historyBox = Hive.box<List<String>>(AppConstants.historyBox);
  List<String> history =
      historyBox.get(AppConstants.searchHistory, defaultValue: [])!;
  if (!history.contains(term)) {
    history.add(term);
    historyBox.put(AppConstants.searchHistory, history);
  }
}

List<String> getSearchHistory() {
  var historyBox = Hive.box<List<String>>(AppConstants.historyBox);
  return historyBox.get(AppConstants.searchHistory, defaultValue: [])!;
}
