import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_1/generated/assets.dart';
import 'package:task_list_1/utils/extensions.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> imageList = [
    Assets.imagesScooter,
    Assets.imagesScooter,
    Assets.imagesScooter,
    Assets.imagesScooter
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int newIndex = _pageController.page!.round();
      if (_currentIndex != newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            Assets.imagesBackgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight), // specify height
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, left: 15.h, right: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(Assets.imagesBack, height: 25.h, width: 25.w),
                  ),

                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 13.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics :NeverScrollableScrollPhysics(),
                          itemCount: imageList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildIndicator(index == _currentIndex);
                          },
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: Image.asset(Assets.imagesUpArrow, height: 25.h, width: 25.w),
                  ),
                ],
              ),
            ), // your custom app bar widget
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //AppBar
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: imageList.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(Assets.imagesScooter),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: DetailItemView(
                          Assets.imagesKilometer,
                          "25",
                          "Km/h",
                          "Max Speed",
                        ),
                      ),

                      Expanded(child: DetailItemView(Assets.imagesWatt, "350", "W", "Motor")),

                      Expanded(
                        child: DetailItemView(Assets.imagesWatt, "6.4", "Ah", "Battery"),
                      ),
                    ],
                  ),

                  Text(
                    "X7 E-Scooter",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    "You don't need to worry about your battery whether the road is flat ot wet, since our battery is not placed under the standing platform.",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ].separated(separator: SizedBox(height: 25.h)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }

  Widget DetailItemView(
    String icon,
    String value,
    String subVal,
    String description,
  ) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.w),
            color: Colors.white24,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              height: 28.h,
              width: 28.w,
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
          ),
        ),

        SizedBox(height: 10.h),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 22, // big size
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: subVal,
                style: TextStyle(
                  fontSize: 14, // smaller size
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 5.h),

        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.white30),
        ),
      ],
    );
  }
}
