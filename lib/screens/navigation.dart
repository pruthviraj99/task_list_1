import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_1/generated/assets.dart';
import 'package:task_list_1/model_class/home_menu_item.dart';
import 'package:task_list_1/model_class/menu_option_item.dart';
import 'package:task_list_1/resources/colors.dart';

import '../resources/strings.dart';

class NavigationClass extends StatefulWidget {
  const NavigationClass({super.key});

  @override
  State<NavigationClass> createState() => _NavigationClassState();
}

class _NavigationClassState extends State<NavigationClass>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int _selectedOptionIndex = 0;
  int _selectedMenuOptionIndex = 0;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _paddingAnimation;
  late Animation<double?> _topAnimation;
  late Animation<double> _tweenSequenceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: primaryColor,
    ).animate(_controller);

    _paddingAnimation = Tween(begin: 0.0, end: 20.0).animate(_controller);
    _topAnimation = Tween(begin: 0.0, end: 20.0).animate(_controller);
    _tweenSequenceAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 100, end: 180), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 180, end: 100), weight: 50),
    ]).animate(_controller);

    //Check Animation Status using below listener
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  final List<MenuItem> menuItemList = [
    MenuItem(
      menuName: "Home",
      menuIcon: Assets.imagesHomeSelected,
      unselectedItem: Assets.imagesHomeUnselected,
    ),
    MenuItem(
      menuName: "Group",
      menuIcon: Assets.imagesGroupSelected,
      unselectedItem: Assets.imagesGroupUnselected,
    ),
    MenuItem(
      menuName: "Bone",
      menuIcon: Assets.imagesBoneSelected,
      unselectedItem: Assets.imagesBoneUnselected,
    ),
    MenuItem(
      menuName: "Add",
      menuIcon: Assets.imagesAddSelected,
      unselectedItem: Assets.imagesAddUnselected,
    ),
  ];

  final List<String> menuOption = [bio, chipInfo, features];

  final List<MenuOptionItem> menuOptionItemList = [
    MenuOptionItem(
      optionTitle: "10 Mon",
      optionDescription: "Age",
      optionBackgroundColor: Colors.blue,
    ),

    MenuOptionItem(
      optionTitle: "Male",
      optionDescription: "Sex",
      optionBackgroundColor: Colors.deepOrange,
    ),

    MenuOptionItem(
      optionTitle: "Shibu Inu",
      optionDescription: "Breed",
      optionBackgroundColor: Colors.pink,
    ),

    MenuOptionItem(
      optionTitle: "14 Kg",
      optionDescription: "Weight",
      optionBackgroundColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              children: [
                //Top Portion
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Container(
                      padding: EdgeInsets.all(16.h),
                      decoration: BoxDecoration(
                        color: _colorAnimation.value,
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ), // Rounded background
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Display Header Images
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.search, color: Colors.white),
                              Icon(Icons.menu, color: Colors.white),
                            ],
                          ),

                          AnimatedBuilder(
                            animation: _controller,
                            builder: (BuildContext context, Widget? child) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: _topAnimation.value ?? 0,
                                ),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),

                          Container(
                            margin: EdgeInsets.all(10.h),
                            child: Center(
                              child: Image(
                                image: AssetImage(Assets.imagesDog),
                                height: 220.h,
                                width: 250.w,
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 10.h),

                //Menu Item List
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: menuOption.length,
                          itemBuilder: (context, index) {
                            return MenuOption(menuOption[index], index);
                          },
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        Assets.imagesFilter,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                //Item List
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: menuOptionItemList.length,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      final item = menuOptionItemList[index];
                      return MenuOptionItemData(item, index);
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                Row(
                  children: [
                    CircleAvatar(child: Icon(Icons.man)),

                    SizedBox(width: 15.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pruthvirajsinh Gohil",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 1.h),

                          Text(
                            "Owner",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 15.w),

                    Icon(Icons.add_location, color: primaryColor),

                    SizedBox(width: 5.w),

                    Text(
                      "1.3 K.M",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationMenu(menuItemList[0], 0),
            NavigationMenu(menuItemList[1], 1),
            NavigationMenu(menuItemList[2], 2),
            NavigationMenu(menuItemList[3], 3),
          ],
        ),
      ),
    );
  }

  Widget MenuOptionItemData(MenuOptionItem item, int index) {
    final isSelected = _selectedMenuOptionIndex == index;
    print("isSeleced :: $isSelected");

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return InkWell(
          onTap: () {
            setState(() {
              _selectedMenuOptionIndex = index;
              _controller.reset();
              _controller.forward();
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Container(
              width: isSelected ? _tweenSequenceAnimation.value : 100.w,
              decoration: BoxDecoration(
                color: item.optionBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.optionTitle,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 1.h),

                  Text(
                    item.optionDescription,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget MenuOption(String item, int index) {
    final isSelected = _selectedOptionIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedOptionIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(item),
            SizedBox(height: 5.h),
            Container(
              width: 6.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget NavigationMenu(MenuItem navigationItem, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isSelected
                  ? navigationItem.menuIcon
                  : navigationItem.unselectedItem,
              height: 20.h,
              width: 20.w,
            ),
            if (isSelected) SizedBox(width: 12.w),
            if (isSelected)
              Text(
                navigationItem.menuName,
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
