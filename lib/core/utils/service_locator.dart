import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quick_mart/core/utils/api_service.dart';
import 'package:quick_mart/core/utils/stripe_service.dart';
import 'package:quick_mart/features/auth/data/repos/auth_repo_impl.dart';
import 'package:quick_mart/features/cart/data/repos/cart_repo_impl.dart';
import 'package:quick_mart/features/checkout/data/repos/payment_repo_impl.dart';
import 'package:quick_mart/features/checkout/data/repos/shipping_repo_impl.dart';
import 'package:quick_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:quick_mart/features/product_details/data/repos/product_detail_repo_impl.dart';
import 'package:quick_mart/features/profile/data/repos/order_history_repo_impl.dart';
import 'package:quick_mart/features/whishlist/data/repo/wishlist_repo.dart';
import 'package:quick_mart/features/whishlist/data/repo/wishlist_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProductDetailRepoImpl>(
      ProductDetailRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<CartReopImpl>(
      CartReopImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<WishlistRepo>(
      WishlistRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ShippingRepoImpl>(
      ShippingRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<OrderHistoryRepoImpl>(
      OrderHistoryRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<PaymentRepoImpl>(PaymentRepoImpl(
      stripeService: StripeService(apiService: getIt.get<ApiService>())));
}
