import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_1/model_class/task_item.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2>
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),

                  color: Colors.deepOrange,
                ),
              ),
            ),

            AnimatedBuilder(
              animation: _tweenAnimation,
              builder: (context, child) {
                return Positioned(
                  top: 50 * _tweenAnimation.value,
                  bottom: 50 * _tweenAnimation.value,
                  left: 150 * _tweenAnimation.value,
                  right: -200 * _tweenAnimation.value,
                  child: child!,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              taskData.taskCount,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                            Text(
                                              taskData.taskViewer,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
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
                                    child: Icon(Icons.menu, size: 30.sp),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 50.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "All",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.radio_button_checked, color: Colors.white),
                        SizedBox(width: 20.w),
                        Icon(Icons.home, color: Colors.white),
                        SizedBox(width: 20.w),
                        Icon(Icons.settings, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
