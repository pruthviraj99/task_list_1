import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_1/resources/strings.dart';

class AppIntroduction extends StatefulWidget {
  const AppIntroduction({super.key});

  @override
  State<AppIntroduction> createState() => _AppIntroductionState();
}

class _AppIntroductionState extends State<AppIntroduction> {
  PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  final imageLinks = <String>[
    'https://www.adamgault.co.uk/wp-content/uploads/2015/11/TradeIndustry038.jpg',
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg',
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg',
  ];

  final iconList = <IconData>[Icons.camera, Icons.wb_cloudy, Icons.wb_sunny];

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imageLinks.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: Listener(
                onPointerDown: (_) => stopAutoScroll(),
                onPointerUp: (_) => _startAutoScroll(),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageLinks.length,
                  itemBuilder: (context, index) {
                    return CustomOption(imageLinks[index]);
                  },
                ),
              ),
            ),

            Text("SIGN IN TO CONTINUE", style: TextStyle(fontSize: 20.sp)),

            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: SizedBox(
                height: 50.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: iconList.length,
                        itemBuilder: (context, index) {
                          final icon = iconList[index];
                          return OptionView(icon);
                        },
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        final encodedPath = Uri.encodeComponent(
                          imageLinks[_currentPage],
                        );
                        stopAutoScroll();
                        context
                            .pushNamed(
                              'Authentication',
                              pathParameters: {'imagePath': encodedPath},
                            )
                            .then((_) {
                              _startAutoScroll();
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.h,
                          vertical: 10.h,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text("Email"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomOption(String imagePath) {
    return Hero(
      tag: imagePath,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black45, // Overlay color for readability
          ),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),

              Text(
                coffeeBeans.toUpperCase(),
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),

              Text(
                monthlySubscription.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),

              Spacer(),

              Padding(
                padding: EdgeInsets.all(10.h),
                child: Text(
                  coffeeBeanMessage,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomOption1(String imagePath) {
    return Hero(
      tag: imagePath,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imagePath),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15.h),

              Text(
                coffeeBeans.toUpperCase(),
                style: TextStyle(
                  fontSize: 40.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                monthlySubscription.toUpperCase(),
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),

              Spacer(),

              Padding(
                padding: EdgeInsets.all(10.h),
                child: Text(
                  coffeeBeanMessage,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget OptionView(IconData icon) {
    return Container(
      padding: EdgeInsets.all(13.h),
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.w),
        border: Border.all(color: Colors.black),
      ),
      child: Icon(icon),
    );
  }
}
