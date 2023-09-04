import 'package:chef/features/auth/presentation/cubit/componanents/screens/chang_longe.dart';
import 'package:chef/features/auth/presentation/cubit/componanents/screens/login_screen.dart';
import 'package:chef/features/auth/presentation/cubit/componanents/screens/reset_password.dart';
import 'package:chef/features/auth/presentation/cubit/componanents/screens/send_code_screen.dart';
import 'package:chef/features/menu/presentation/cubit/componanents/screens/add_meal_screen.dart';
import 'package:chef/features/menu/presentation/cubit/componanents/screens/menu_home.dart';
import 'package:chef/features/profile/presentation/cubit/componanents/screens/change_password.dart';
import 'package:chef/features/profile/presentation/cubit/componanents/screens/profil_home.dart';
import 'package:chef/features/profile/presentation/cubit/componanents/screens/setting_screen.dart';
import 'package:chef/features/profile/presentation/cubit/componanents/screens/update_profil.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String intitlRoute = '/';
  static const String login = '/login';
  static const String changelang = '/changelang';
  static const String sendCode = '/sendCode';
  static const String restPassword = '/restPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String setting = '/setting';
  static const String changePassword = '/changePassword';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.changelang:
        return MaterialPageRoute(builder: (_) => const ChangeLongScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.restPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.menuHome:
        return MaterialPageRoute(builder: (_) => const MenuHomeScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
      case Routes.profileHome:
        return MaterialPageRoute(builder: (_) => const ProfilHomeScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfilScreen());
      case Routes.setting:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
