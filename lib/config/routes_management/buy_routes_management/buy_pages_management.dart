import 'package:advedro/feature/buy/auth/forget_password/presentation/binding/forget_password_binding.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/view/forget_password_goto_login_view/forget_password_goto_login_view.dart';
import 'package:advedro/feature/buy/auth/forget_password/presentation/view/forget_password_view/forget_password_view.dart';
import 'package:advedro/feature/buy/media_library/add_creative/presentation/binding/add_creative_binding.dart';
import 'package:advedro/feature/buy/media_library/add_creative/presentation/view/add_creative_view.dart';
import 'package:get/get.dart';
import '../../../feature/buy/auth/change_password/presentation/binding/change_password_binding.dart';
import '../../../feature/buy/auth/change_password/presentation/view/change_password_view.dart';
import '../../../feature/buy/auth/login/presentation/binding/login_binding.dart';
import '../../../feature/buy/auth/login/presentation/view/login_view.dart';
import '../../../feature/buy/auth/login_or_signup/presentation/view/login_or_signup.dart';
import '../../../feature/buy/auth/signup/presentation/binding/signup_binding.dart';
import '../../../feature/buy/auth/signup/presentation/view/signup_view/signup_view.dart';
import '../../../feature/buy/buy_home/presentation/binding/buy_home_binding.dart';
import '../../../feature/buy/buy_home/presentation/view/buy_home_view.dart';
import '../../../feature/buy/media_library/medialibraries/presentation/binding/medialibraries_binding.dart';
import '../../../feature/buy/media_library/medialibraries/presentation/view/medialibraries_view.dart';
import '../../../feature/buy/media_library/medialibrary/presentation/binding/medialibrary_binding.dart';
import '../../../feature/buy/media_library/medialibrary/presentation/view/medialibrary_view.dart';
import '../../../feature/buy/temp/presentation/binding/temp_binding.dart';
import '../../../feature/buy/temp/presentation/view/temp_page.dart';
import '../../../feature/home/home.dart';
import 'buy_routes.dart';

class BuyPages {
  static final pages = <GetPage>[
    // Auth - login or signup
    GetPage(
      name: BuyRoutes.loginOrSignUp,
      page: () => const LoginOrSignUpView(),
    ),
    // login
    GetPage(
      name: BuyRoutes.login,
      binding: LoginBinding(),
      page: () => const LoginView(),
    ),
    // signup
    GetPage(
      name: BuyRoutes.signUp,
      binding: SignUpBinding(),
      page: () => const SignUpView(),
    ),
    // change password
    GetPage(
      name: BuyRoutes.changePassword,
      binding: ChangePasswordBinding(),
      page: () => const ChangePasswordView(),
    ),
    // forget password
    GetPage(
      name: BuyRoutes.forgetPassword,
      binding: ForgetPasswordBinding(),
      page: () => const ForgetPasswordView(),
    ),
    GetPage(
      name: BuyRoutes.goToLogin,
      binding: ForgetPasswordBinding(),
      page: () => const ForgetPasswordGoToLoginView(),
    ),

    // base pages
    GetPage(
      name: BuyRoutes.home,
      page: () => const Home(),
    ),
    GetPage(
      name: BuyRoutes.buyHome,
      binding: BuyHomeBinding(),
      page: () => const BuyHomeView(),
    ),
    GetPage(
      name: BuyRoutes.temp,
      binding: TempBinding(),
      page: () => const TempPage(),
    ),
    GetPage(
      name: BuyRoutes.mediaLibraries,
      binding: MediaLibrariesBinding(),
      page: () => const MediaLibrariesView(),
    ),
    GetPage(
      name: BuyRoutes.mediaLibrary,
      binding: MediaLibraryBinding(),
      page: () => const MediaLibraryView(),
    ),
    GetPage(
      name: BuyRoutes.addCreative,
      binding: AddCreativeBinding(),
      page: () => const AddCreativeView(),
    ),
  ];
}
