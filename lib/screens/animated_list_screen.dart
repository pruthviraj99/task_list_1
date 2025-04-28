import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated List",
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ItemView();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ItemView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Row(
        children: [
          Icon(Icons.account_circle, size: 40.h, color: Colors.black54),

          SizedBox(width: 10.h),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pruthvirajsinh",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 2.h),

                Text("Software Developer", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),

          SizedBox(width: 5.h),

          Text("Mobile", style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
