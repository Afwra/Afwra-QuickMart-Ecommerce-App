import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_animations.dart';
import 'package:quick_mart/core/utils/service_locator.dart';
import 'package:quick_mart/features/auth/presentaion/views/forgot_password_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/login_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/password_created_success_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/register_view.dart';
import 'package:quick_mart/features/checkout/presentation/views/checkout_view.dart';
import 'package:quick_mart/features/checkout/presentation/views/order_complete_view.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/data/models/product_model.dart';
import 'package:quick_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/home_layout.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/categories_view/category_product_listing_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/search_result_view.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_view/search_view.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:quick_mart/features/product_details/presentation/views/product_detail_view.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/change_password_section/change_password_view.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/orders_history_section/orders_history_view.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/payment_method_section/payment_method_view.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/privacy_policy_section/privacy_policy_view.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/shipping_address_section/shipping_address_view.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/terms_and_conditions_section/terms_and_conditions_view.dart';
import 'package:quick_mart/features/splash_screen/presentation/views/splash_screen_view.dart';

abstract class AppRoutes {
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kForgotPasswordView = '/ForgotPasswordView';
  static const kPasswordChangeSuccess = '/PasswordChangeSuccess';
  static const kHomeLayout = '/HomeLayout';
  static const kHomeView = '/HomeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/SearchView';
  static const kSearchResultsView = '/SearchResultsView';
  static const kProductsListingView = '/ProductsListingView';
  static const kProductsDetailsView = '/ProductsDetailsView';
  static const kShippingAddress = '/ShippingAddressView';
  static const kPaymentMethod = '/PaymentMethodView';
  static const kOrderHistory = '/OrderHistoryView';
  static const kChangePassword = '/ChangePasswordView';
  static const kPrivacyPolicy = '/PrivacyPolicyView';
  static const kTermsAndConditions = '/TermsAndConditionsView';
  static const kCheckoutView = '/CheckoutView';
  static const kPaymentSuccess = '/PaymentSuccess';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreenView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        pageBuilder: (context, state) =>
            AppAnimations.customGrowTransition(state, const OnBoardingView()),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideUpTransition(state, const LoginView()),
      ),
      GoRoute(
        path: kRegisterView,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideUpTransition(state, const RegisterView()),
      ),
      GoRoute(
        path: kForgotPasswordView,
        pageBuilder: (context, state) => AppAnimations.customSlideUpTransition(
            state, const ForgotPasswordView()),
      ),
      GoRoute(
        path: kPasswordChangeSuccess,
        pageBuilder: (context, state) => AppAnimations.customSlideUpTransition(
            state, const PasswordCreatedSuccessView()),
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideUpTransition(state, const SearchView()),
      ),
      GoRoute(
        path: kSearchResultsView,
        pageBuilder: (context, state) => AppAnimations.customGrowTransition(
            state, SearchResultView(title: state.extra as String)),
      ),
      GoRoute(
        path: kProductsDetailsView,
        pageBuilder: (context, state) => AppAnimations.customGrowTransition(
            state, ProductDetailView(product: state.extra as ProductModel)),
      ),
      GoRoute(
        path: kShippingAddress,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideLeftTransition(
                state, const ShippingAddressView()),
      ),
      GoRoute(
        path: kPaymentMethod,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideLeftTransition(
                state, const PaymentMethodView()),
      ),
      GoRoute(
        path: kOrderHistory,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideLeftTransition(
                state, const OrdersHistoryView()),
      ),
      GoRoute(
        path: kChangePassword,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideLeftTransition(
                state, const ChangePasswordView()),
      ),
      GoRoute(
        path: kPrivacyPolicy,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideLeftTransition(
                state, const PrivacyPolicyView()),
      ),
      GoRoute(
        path: kTermsAndConditions,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideLeftTransition(
                state, const TermsAndConditionsView()),
      ),
      GoRoute(
        path: kCheckoutView,
        pageBuilder: (context, state) =>
            AppAnimations.customSlideUpTransition(state, const CheckoutView()),
      ),
      GoRoute(
        path: kHomeLayout,
        pageBuilder: (context, state) => AppAnimations.customGrowTransition(
            state,
            BlocProvider(
              create: (context) =>
                  HomeCubit(getIt.get<HomeRepoImpl>())..getUserProfilePicture(),
              child: HomeLayout(
                passedPageIndex:
                    state.extra == null ? null : (state.extra as int),
              ),
            )),
      ),
      GoRoute(
        path: kPaymentSuccess,
        pageBuilder: (context, state) => AppAnimations.customGrowTransition(
            state, const OrderCompleteView()),
      ),

      GoRoute(
        path: kProductsListingView,
        builder: (context, state) =>
            CategoryProductListingView(category: state.extra as CategoryModel),
      ),
      // GoRoute(
      //   path: kDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>())
      //       ..fetchSimilarBooks(
      //           category: (state.extra as BookModel).volumeInfo.categories![0]),
      //     child: BookDetailsView(
      //       book: state.extra as BookModel,
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => const SearchView(),
      // ),
    ],
  );
}
