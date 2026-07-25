import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Splash
import 'screens/splash/splash_screen.dart';

// Onboarding
import 'screens/onboarding/onboarding_screen.dart';

// Authentication
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/forgot_password_screen.dart';

// Home
import 'screens/home/home_screen.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/search/search_screen.dart';

// Products
import 'screens/product/product_list_screen.dart';
import 'screens/product/product_details_screen.dart';

// Wishlist & Cart
import 'screens/wishlist/wishlist_screen.dart';
import 'screens/cart/cart_screen.dart';

// Checkout
import 'screens/checkout/checkout_screen.dart';
import 'screens/checkout/order_success_screen.dart';

// Orders
import 'screens/orders/order_history_screen.dart';
import 'screens/orders/order_details_screen.dart';
import 'screens/orders/order_tracking_screen.dart';

// Profile
import 'screens/profile/profile_screen.dart';
import 'screens/profile/edit_profile_screen.dart';

// Settings
import 'screens/settings/settings_screen.dart';

// Admin
import 'screens/admin/admin_dashboard_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const LuccoApp());
}

class LuccoApp extends StatelessWidget {
  const LuccoApp({super.key});

  static const Color primaryColor = Color.fromRGBO(245, 107, 119, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LUCCO Fashion Store",

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(245, 107, 119, 1),
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(245, 107, 119, 1),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 55),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),

      initialRoute: "/",

      routes: {
        "/": (context) => const SplashScreen(),

        "/onboarding": (context) => const OnboardingScreen(),

        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/forgot-password": (context) => const ForgotPasswordScreen(),

        "/home": (context) => const HomeScreen(),
        "/categories": (context) => const CategoriesScreen(),
        "/search": (context) => const SearchScreen(),

        "/product-list": (context) => const ProductListScreen(),
        "/product-details": (context) => const ProductDetailsScreen(),

        "/wishlist": (context) => const WishlistScreen(),
        "/cart": (context) => const CartScreen(),

        "/checkout": (context) => const CheckoutScreen(),
        "/order-success": (context) => const OrderSuccessScreen(),

        "/order-history": (context) => const OrderHistoryScreen(),
        "/order-details": (context) => const OrderDetailsScreen(),
        "/order-tracking": (context) => const OrderTrackingScreen(),

        "/profile": (context) => const ProfileScreen(),
        "/edit-profile": (context) => const EditProfileScreen(),

        "/settings": (context) => const SettingsScreen(),

        "/admin": (context) => const AdminDashboardScreen(),
      },
    );
  }
}
