import 'package:quick_mart/features/home/presentation/views/widgets/custom_filter_bottom_sheet.dart';

class AppConstants {
  //hive
  static const String settingsBox = 'settings';
  static const String historyBox = 'history';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String loginToken = 'login_token';
  static const String darkModeStatus = 'dark_mode_status';
  static const String languageCode = 'language_code';
  static const String searchHistory = 'search_history';
  //api
  static const String apiEndpoint = 'https://student.valuxapps.com/api/';
  static const String loginEndpoint = 'login';
  static const String registerEndpoint = 'register';
  static const String latestProductsEndpoint = 'home';
  static const String bannersEndpoint = 'banners';
  static const String categoriesEndpoint = 'categories';
  static const String categoriesProductsEndpoint = 'categories/';
  static const String searchEndpoint = 'products/search';
  static const String favoritesEndpoint = 'favorites';
  static const String cartsEndpoint = 'carts';
  static const String userProfileEndpoint = 'profile';

  //others
  static const String profilePictureLink = 'https://t.ly/3msp8';
  static const String exclusivePictureLink = 'https://t.ly/K4Urj';

  static final List<FilterModel> filterList = [
    FilterModel(
        title: 'Price (Low to High)',
        value: true,
        filterType: FilterTypes.lowToHigh),
    FilterModel(
        title: 'Price (High to Low)',
        value: false,
        filterType: FilterTypes.highToLow),
    FilterModel(
      title: 'A - Z',
      value: false,
      filterType: FilterTypes.aToZ,
    ),
    FilterModel(
      title: 'Z - A',
      value: false,
      filterType: FilterTypes.zToA,
    ),
  ];
}
