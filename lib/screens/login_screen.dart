import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _increaseSizeAnimation;
  late Animation<double> _decreaseSizeAnimation;

  bool isLogin = false;
  bool isSignUp = false;

  bool isPerformClick = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _increaseSizeAnimation = Tween(begin: 0.0, end: 50.0).animate(_controller);
    _decreaseSizeAnimation = Tween(begin: 50.0, end: 0.0).animate(_controller);
  }

  void _loginClicked() {
    setState(() {
      isPerformClick = true;
      isLogin = !isLogin;
      isSignUp = false;
    });
  }

  void _signUpClicked() {
    setState(() {
      isPerformClick = true;
      isLogin = false;
      isSignUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    print("IsLogin :: $isLogin | IsSignUp :: $isSignUp");

    return Scaffold(
      body: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _loginClicked();
                        _controller.forward();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(180.r),
                            bottomRight: Radius.circular(180.r),
                          ),

                          color: Colors.blue[900],
                        ),
                        height: 300.h + _animation.value * 200.h,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isLogin ? buildLoginForm() :
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 50.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _loginClicked();
                          _controller.reverse();
                        },
                        child: Container(
                          height: 300.h,
                          color: Colors.green,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              !isLogin? buildSignUpForm() : Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize:  50.sp,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }


  // Login Form
  Widget buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        key: ValueKey("loginForm"),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              fillColor: Colors.white,
            ),
            obscureText: true,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: Text("Login"),
          )
        ],
      ),
    );
  }

  // Sign Up Form
  Widget buildSignUpForm() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        key: ValueKey("signupForm"),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Name",
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
              filled: true,
              fillColor: Colors.white,
            ),
            obscureText: true,
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign Up"),
          )
        ],
      ),
    );
  }
}
