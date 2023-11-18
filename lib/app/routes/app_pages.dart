import 'package:get/get.dart';

import '../modules/detail_video/bindings/detail_video_binding.dart';
import '../modules/detail_video/views/detail_video_view.dart';
import '../modules/forum/bindings/forum_binding.dart';
import '../modules/forum/views/forum_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_creator/bindings/home_creator_binding.dart';
import '../modules/home_creator/views/home_creator_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';
import '../modules/navbar/views/navbar_view.dart';
import '../modules/navbar_creator/bindings/navbar_creator_binding.dart';
import '../modules/navbar_creator/views/navbar_creator_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_creator/bindings/profile_creator_binding.dart';
import '../modules/profile_creator/views/profile_creator_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTRODUCTION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => const ForumView(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_VIDEO,
      page: () => DetailVideoView(),
      binding: DetailVideoBinding(),
    ),
    GetPage(
      name: _Paths.HOME_CREATOR,
      page: () => const HomeCreatorView(),
      binding: HomeCreatorBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR_CREATOR,
      page: () => const NavbarCreatorView(),
      binding: NavbarCreatorBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_CREATOR,
      page: () => const ProfileCreatorView(),
      binding: ProfileCreatorBinding(),
    ),
  ];
}
