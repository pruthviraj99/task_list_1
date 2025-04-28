import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthenticationScreen extends StatefulWidget {
  final String imagePath;

  const AuthenticationScreen({super.key, required this.imagePath});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  int _selectedIndex = 0;
  bool _obscureText = true;

  final List<String> menuList = ["Sign In", "Sign Up"];

  final imageLinks = <String>[
    'https://www.adamgault.co.uk/wp-content/uploads/2015/11/TradeIndustry038.jpg',
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg',
    'https://img.etimg.com/thumb/msid-66650613,width-643,imgsize-801611,resizemode-4/coffee.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25.w, 45.h, 25.w, 15.h),
          child: Column(
            children: [
              Hero(
                tag: widget.imagePath,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imagePath),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 20.h,
                        ),
                        child: Row(
                          children: [
                            /*Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.w),
                                color: Colors.blue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SizedBox(
                                  height: 28.h,
                                  width: 28.w,
                                  child: Icon(
                                    _selectedIndex == 0
                                        ? Icons.group
                                        : Icons.create_outlined,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                */
                            MenuOption(menuList[0], 0),

                            SizedBox(width: 10.w),

                            MenuOption(menuList[1], 1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              if (_selectedIndex == 1)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.h),
                      child: Icon(Icons.account_circle, color: Colors.brown),
                    ),

                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.brown),
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ), // optional: focus color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              if (_selectedIndex == 1) SizedBox(height: 10.w),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.h),
                    child: Icon(Icons.email, color: Colors.brown),
                  ),

                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.brown),
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ), // optional: focus color
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.w),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.h),
                    child: Icon(Icons.lock, color: Colors.brown),
                  ),

                  Expanded(
                    child: TextField(
                      obscureText: _obscureText,
                      style: TextStyle(color: Colors.brown),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ), // optional: focus color
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.brown,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align to the right
                children: [
                  Text(
                    'Forgot?',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.h),
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.brown),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      "Social Login",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),

                  Spacer(),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.w),
                      color: Colors.brown,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(
                        height: 28.h,
                        width: 28.w,
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MenuOption(String item, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: SizedBox(
        height: 35.h,
        child: Column(
          children: [
            Text(
              item.toUpperCase(),
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? Colors.white : Colors.white70,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
            ),

            SizedBox(height: 5.h),

            Container(
              width: 50.w,
              height: 2.h,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                shape: BoxShape.rectangle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
