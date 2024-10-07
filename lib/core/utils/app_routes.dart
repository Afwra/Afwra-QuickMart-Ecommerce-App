import 'package:go_router/go_router.dart';
import 'package:quick_mart/features/auth/presentaion/views/forgot_password_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/login_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/password_created_success_view.dart';
import 'package:quick_mart/features/auth/presentaion/views/register_view.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:quick_mart/features/splash_screen/presentation/views/splash_screen_view.dart';

abstract class AppRoutes {
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kForgotPasswordView = '/ForgotPasswordView';
  static const kPasswordChangeSuccess = '/PasswordChangeSuccess';
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreenView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kPasswordChangeSuccess,
        builder: (context, state) => const PasswordCreatedSuccessView(),
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
