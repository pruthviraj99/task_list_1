
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pushNamed("Task1");
                },
                child: Text("Task 1 : Bottom Navigation"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("Task2");
                },
                child: Text("Task 2 : Detail Screen"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("Task3");
                },
                child: Text("Task 3 : Product List Screen"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("Task4");
                },
                child: Text("Task 4 : Image Detail Screen"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("Task5");
                },
                child: Text("Task 5 : App Introduction"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("card_screen");
                },
                child: Text("Task 6 : Card view"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("animated_list");
                },
                child: Text("Task 7 : Animated List"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("home_screen_2");
                },
                child: Text("Task 8 : Home Screen"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("drawer_animation");
                },
                child: Text("Task 9 : Drawer Animation"),
              ),

              SizedBox(height: 10.h),

              ElevatedButton(
                onPressed: () {
                  context.pushNamed("login_screen");
                },
                child: Text("Task 9 : Login Screen"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
