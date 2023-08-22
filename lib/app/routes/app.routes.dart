
part of 'routes_imports.dart';

class AppRouter {
  static const String splashRoute = "/splash";
  static const String onBoardRoute = "/onBoard";
  static const String productRoute = "/product";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signup";
  static const String appSettingsRoute = "/appSettings";
  static const String homeRoute = "/home";
  static const String cartRoute = "/cart";
  static const String searchRoute = "/search";
  static const String profileRoute = "/profile";
  static const String accountInfo = "/accountInfo";
  static const String forgotPassword = "/forgotPassword";
  static const String otpVerification = "/otpVerification";
  static const String resetPass = '/resetPassword';
  static const String categoryRoute = "/category";
  static const String prodDetailRoute = "/productDetail";
  static const String editProfileRoute = "/editProfile";
  static const String changePassRoute = "/changePassword";
  static const String homedeshbordseller = "/homedeshbordseller";
  static const String sellerScreen = "/SellerScreen";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case editProfileRoute:
        {
          return MaterialPageRoute(
            builder: (_) => EditProfileScreen(),
          );
        }
      case appSettingsRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const AppSettings(),
          );
        }
      case homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
      case splashRoute:
        {
          return ConcentricPageRoute(
            fullscreenDialog: true,
            builder: (_) => const SplashScreen(),
          );
        }
      case onBoardRoute:
        {
          return MaterialPageRoute(
            builder: (_) => OnBoardingScreen(),
          );
        }
      case productRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const ProductScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      case signUpRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SignUpScreen(),
          );
        }
      case forgotPassword:
        {
          return MaterialPageRoute(
            builder: (_) => ForgotPasswordScreen(),
          );
        }
      case otpVerification:
        {
          return MaterialPageRoute(
            builder: (_) => OtpVerificationScreen(),
          );
        }

      case resetPass:
        {
          return MaterialPageRoute(
            builder: (_) => ResetPasswordScreen(),
          );
        }
      case prodDetailRoute:
        {
          return MaterialPageRoute(
            builder: (context) => ProductDetail(
              productDetailsArguements: ModalRoute.of(context)!
                  .settings
                  .arguments as ProductDetailsArgs,
            ),
            settings: settings,
          );
        }
      case cartRoute:
        {
          return MaterialPageRoute(
            builder: (_) =>  AddToCart(),
          );
        }
      case searchRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SearchScreen(),
          );
        }
      case profileRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const UserProfile(),
          );
        }
      case categoryRoute:
        {
          return MaterialPageRoute(
            builder: (context) => CategoryScreen(
              categoryScreenArgs: ModalRoute.of(context)!.settings.arguments
                  as CategoryScreenArgs,
            ),
            settings: settings,
          );
        }
      case accountInfo:
        {
          return MaterialPageRoute(
            builder: (_) => const AccountInformationScreen(),
          );
        }
      case changePassRoute:
        {
          return MaterialPageRoute(
            builder: (_) => ChangePasswordScreen(),
          );
        }
      case homedeshbordseller:
        {
          return MaterialPageRoute(
            builder: (_) => HomeDeshbordSeller(),
          );
        }
        case sellerScreen:
      {
        return MaterialPageRoute(
          builder: (_) => SellerScreen(),
        );
      }
    }
  }
}
