import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_1/model_class/drawer_item.dart';
import 'package:task_list_1/model_class/task_item.dart';
import 'package:task_list_1/resources/colors.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _tweenAnimation;

  final List<TaskItem> taskList = [
    TaskItem(taskName: "Task 1 ", taskCount: "10", taskViewer: "1925"),
    TaskItem(taskName: "Task 2 ", taskCount: "20", taskViewer: "1925"),
    TaskItem(taskName: "Task 3 ", taskCount: "30", taskViewer: "1925"),
    TaskItem(taskName: "Task 4 ", taskCount: "40", taskViewer: "1925"),
    TaskItem(taskName: "Task 5 ", taskCount: "50", taskViewer: "1925"),
    TaskItem(taskName: "Task 5 ", taskCount: "50", taskViewer: "1925"),
  ];

  final List<DrawerItem> middleMenu = [
    DrawerItem(itemName: "Search", itemIcon: Icons.search),
    DrawerItem(itemName: "Basket", itemIcon: Icons.shopping_cart),
    DrawerItem(itemName: "Discount", itemIcon: Icons.favorite),
    DrawerItem(itemName: "Orders", itemIcon: Icons.format_list_bulleted),
  ];

  final List<DrawerItem> bottomMenu = [
    DrawerItem(itemName: "Setting", itemIcon: Icons.settings),
    DrawerItem(itemName: "Support", itemIcon: Icons.support),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _tweenAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                _controller.reverse();
              },
              child: Container(
                color: Colors.lightBlue,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 30.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png",
                            ),
                          ),

                          SizedBox(width: 10.w),

                          Text(
                            "Menu Item 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 70.h),

                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: middleMenu.length,
                          itemBuilder: (context, index) {
                            final taskData = middleMenu[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(taskData.itemIcon, color: Colors.white),
                                  SizedBox(width: 20.w),
                                  Text(
                                    taskData.itemName,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      Container(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: bottomMenu.length,
                          itemBuilder: (context, index) {
                            final taskData = bottomMenu[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(taskData.itemIcon, color: Colors.white),
                                  SizedBox(width: 20.w),
                                  Text(
                                    taskData.itemName,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: 60 * _tweenAnimation.value,
                  left: 300 * _tweenAnimation.value,
                  right: -300 * _tweenAnimation.value,
                  bottom: 50 * _tweenAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        _tweenAnimation.value * 30,
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Positioned(
                                top: 10,
                                left: 10, // Set distance from left
                                child: InkWell(
                                  onTap: () {
                                    _controller.forward();
                                  },
                                  child: Icon(Icons.menu, size: 30.sp),
                                ),
                              ),

                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              child: ListView.builder(
                                itemCount: taskList.length,
                                itemBuilder: (context, index) {
                                  final taskData = taskList[index];
                                  return Card(
                                    color: Colors.white,
                                    elevation: 3,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                taskData.taskName,
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),

                                              SizedBox(height: 15.h),

                                              Center(child: Icon(Icons.task)),

                                              SizedBox(height: 15.h),

                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      taskData.taskCount,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),

                                                    Text(
                                                      taskData.taskViewer,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                          Positioned(
                                            right: 15,
                                            top: 10,
                                            child: Icon(
                                              Icons.menu,
                                              size: 30.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          Divider(color: Colors.grey, thickness: 1),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.radio_button_checked),
                                SizedBox(width: 20.w),
                                Icon(Icons.home),
                                SizedBox(width: 20.w),
                                Icon(Icons.settings),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
