import 'package:quick_mart/features/home/data/models/banner_model.dart';

sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerSuccess extends BannerState {
  final List<BannerModel> banners;
  BannerSuccess({required this.banners});
}

final class BannerError extends BannerState {
  final String errMsg;
  BannerError({required this.errMsg});
}
