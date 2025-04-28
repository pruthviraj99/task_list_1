import 'package:go_router/go_router.dart';
import 'package:task_list_1/screens/animated_list_screen.dart';
import 'package:task_list_1/screens/app_introduction.dart';
import 'package:task_list_1/screens/authentication.dart';
import 'package:task_list_1/screens/card_screen.dart';
import 'package:task_list_1/screens/detail_screen.dart';
import 'package:task_list_1/screens/home_screen.dart';
import 'package:task_list_1/screens/home_screen_2.dart';
import 'package:task_list_1/screens/home_screen_3.dart';
import 'package:task_list_1/screens/image_detail.dart';
import 'package:task_list_1/screens/login_screen.dart';
import 'package:task_list_1/screens/navigation.dart';
import 'package:task_list_1/screens/product_list_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "home_screen",
      builder: (builder, state) => HomeScreen(),
    ),

    GoRoute(
      path: "/navigation_screen",
      name: "Task1",
      builder: (builder, state) => NavigationClass(),
    ),

    GoRoute(
      path: "/detail_screen",
      name: "Task2",
      builder: (builder, state) => DetailScreen(),
    ),

    GoRoute(
      path: "/product_list_screen",
      name: "Task3",
      builder: (builder, state) => ProductListScreen(),
    ),

    GoRoute(
      path: "/image_detail_screen",
      name: "Task4",
      builder: (builder, state) => ImageDetailScreen(),
    ),

    GoRoute(
      path: "/app_introduction_screen",
      name: "Task5",
      builder: (builder, state) => AppIntroduction(),
    ),

    GoRoute(
      path: "/authentication_screen/:imagePath",
      name: "Authentication",
      builder: (builder, state) {
        final encodedImage = state.pathParameters['imagePath']!;
        final decodedImage = Uri.decodeComponent(encodedImage);
        return AuthenticationScreen(imagePath: decodedImage);
      },
    ),

    GoRoute(
      path: "/card_screen",
      name: "card_screen",
      builder: (builder, state) => CardScreen(),
    ),

    GoRoute(
      path: "/animated_list",
      name: "animated_list",
      builder: (builder, state) => AnimatedListScreen(),
    ),

    GoRoute(
      path: "/home_screen_2",
      name: "home_screen_2",
      builder: (builder, state) => HomeScreen2(),
    ),

    GoRoute(
      path: "/drawer_animation",
      name: "drawer_animation",
      builder: (builder, state) => HomeScreen3(),
    ),

    GoRoute(
      path: "/login_screen",
      name: "login_screen",
      builder: (builder, state) => LoginScreen(),
    ),
  ],
);
