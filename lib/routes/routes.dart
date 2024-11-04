import 'package:flutter/material.dart';
import '../pages/account_page.dart';
import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';
import '../pages/lupa_password.dart';
import '../pages/profile.dart';
import '../pages/register_page.dart';
import '../pages/splashscreen.dart';
import '../transitions/page_transition.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Routes
      case '/splashscreen':
        return CustomPageTransition(page: const SplashScreen());
      case '/login':
        return CustomPageTransition(page: const LoginPage());
      case '/register':
        return CustomPageTransition(page: const RegisterPage());
      case '/forgot-password':
        return CustomPageTransition(page: const ForgotPasswordPage());
      
      // Main App Routes
      case '/dashboard':
        return CustomPageTransition(page: const DashboardPage());
      case '/profile':
        return CustomPageTransition(page: const ProfilePage());
      case '/account':
        return CustomPageTransition(page: const AccountPage());
      
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route tidak ditemukan'),
            ),
          ),
        );
    }
  }
}

