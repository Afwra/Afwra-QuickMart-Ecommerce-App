import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_mart/core/utils/app_animations.dart';
import 'package:quick_mart/features/auth/presentaion/views/forgot_password_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/login_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/password_created_success_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/register_view.dart';
import 'package:quick_mart/features/home/data/models/category_model.dart';
import 'package:quick_mart/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:quick_mart/features/home/presentation/views/home_layout.dart';
import 'package:quick_mart/features/home/presentation/views/category_product_listing_view.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/on_boarding_view.dart';
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
  static const kSearchView = '/searchView';
  static const kProductsListingView = '/ProductsListingView';
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
        path: kHomeLayout,
        pageBuilder: (context, state) => AppAnimations.customGrowTransition(
            state,
            BlocProvider(
              create: (context) => HomeCubit(),
              child: const HomeLayout(),
            )),
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
