import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_1/model_class/card_item.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;

  final List<CardItem> cardList = [
    CardItem(
      cardName: "Pruthvirajsinh Gohil",
      cardNumber: "1234 5467 8910 1234",
      cardCVV: "123",
      cardExp: "12/28",
      cardType: "VISA",
      cardImageUrl:
          "https://p7.hiclipart.com/preview/29/61/101/visa-credit-card-mastercard-logo-visa.jpg",
    ),

    CardItem(
      cardName: "Nikunj Desai",
      cardNumber: "1234 8910 0001 1234",
      cardCVV: "456",
      cardExp: "02/30",
      cardType: "MASTER",
      cardImageUrl:
          "https://static-00.iconduck.com/assets.00/mastercard-icon-2048x1587-tygju446.png",
    ),

    CardItem(
      cardName: "Ashish Nair",
      cardNumber: "5467 8910 0001",
      cardCVV: "123",
      cardExp: "12/28",
      cardType: "VISA",
      cardImageUrl:
          "https://p7.hiclipart.com/preview/29/61/101/visa-credit-card-mastercard-logo-visa.jpg",
    ),

    CardItem(
      cardName: "Nishant",
      cardNumber: "8910 1234 1234 5467",
      cardCVV: "852",
      cardExp: "08/27",
      cardType: "MASTER",
      cardImageUrl:
          "https://static-00.iconduck.com/assets.00/mastercard-icon-2048x1587-tygju446.png",
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rotationAnimation = Tween<double>(
      begin: 0.0, // -1 full turn counterclockwise
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isRotated = false;

  void _toggleRotation() {
    setState(() {
      isRotated = !isRotated;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top-Left Half Rotating Box",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black38,
      ),

      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (BuildContext context, Widget? child) {
              return Positioned(
                top: 10,
                left: isRotated ? 210 * _rotationAnimation.value : 20,
                right: 20,
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: isRotated ? 0.5 : 1.0, // Show only the top 50% of the container
                  child: Transform.rotate(
                    alignment: Alignment.topLeft,
                    angle: _rotationAnimation.value * 3.1416, // ~180 degrees
                    child: child,
                  ),
                ),
              );
            },
            child: InkWell(
              onTap: () {
                _toggleRotation();
                _controller.forward();
              },
              child: Container(
                height: 200.h,
                width: 300.w,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Container",
                  style: TextStyle(color: Colors.white, fontSize: 25.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top-Left Half Rotating Box")),
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              _controller.forward();
            },
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value * 3.14 / 180,
                  alignment: Alignment.lerp(
                    Alignment.center,
                    Alignment(-.7, -.6),
                    _controller.value,
                  ),
                  child: Container(
                    width: 300,
                    height: 100,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }*/

  /*@override
  Widget build(BuildContext context) {
    double boxSize = 200;

    return Scaffold(
      appBar: AppBar(title: Text("Top-Left Half Rotating Box")),
      body: Stack(
        children: [
          // Clipped area to only show half the box
          AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return StreamBuilder<double>(
                builder: (context, snapshot) {
                  return Positioned(
                    top: 10,
                    left: snapshot.data??0.0,
                    right: 0,
                    child: Transform.rotate(
                      alignment: Alignment.topLeft,
                      angle: _rotationAnimation.value * 3.1416 , // in radians
                      child: child,
                    ),
                  );
                }, stream: uploadProgress.stream,
              );
            },
            child: InkWell(
              onTap: () {
                uploadProgress.add(100);
                _controller.forward();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: MediaQuery.of(context).size.height *0.3,
                height: MediaQuery.of(context).size.width,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Box",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
*/
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rotate + Slide")),
      body: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value * 3.1416,
            alignment: Alignment.topLeft, // radians
            child: child,
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.blue,
          child: Text(
            "Animated Box",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
*/

  /*
  @override
  Widget build(BuildContext context) {
    double angle = isRotated ? pi / 2 : 0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),

            ElevatedButton(
              onPressed: () {
                _toggleRotation();
              },
              child: Text("Rotate Data"),
            ),

            SizedBox(
              height: 220.h,
              width: 350.w,
              child: CstomCardView(context, cardList[0], angle, 0),
            ),

            */ /*SizedBox(
              height: 220.h,
              width: 350.w,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: cardList.length,
                physics: PageScrollPhysics(),
                itemBuilder: (context, index) {
                  final cardItem = cardList[index];
                  return CstomCardView(context, cardItem, angle, index);
                },
              ),
            ),*/ /*
          ],
        ),
      ),
    );
  }*/

  // Widget CstomCardView(
  //   BuildContext context,
  //   CardItem cardItem,
  //   double angle,
  //   int index,
  // ) {
  //   return AnimatedRotation(
  //     duration: Duration(milliseconds: 300),
  //     turns: angle / (2 * pi),
  //     child: CardDataView(cardItem),
  //   );
  //
  //   /* return Container(
  //     color: Colors.red,
  //     width: isRotated ? MediaQuery.of(context).size.width * 0.40 : MediaQuery.of(context).size.width,
  //     height: isRotated ? MediaQuery.of(context).size.height * 0.50 : MediaQuery.of(context).size.height * 0.25,
  //     child: FittedBox(
  //       fit: BoxFit.fitHeight,
  //       child: AnimatedRotation(
  //         duration: Duration(milliseconds: 300),
  //         turns: angle / (2 * pi),
  //         child: CardDataView(cardItem),
  //       ),
  //     ),
  //   );*/
  // }
  /*
  Widget CardDataView(CardItem cardItem) {
    return InkWell(
      onTap: () {
        _toggleRotation();
      },
      child: Card(
        color: Colors.blueAccent,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardItem.cardNumber,
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
              SizedBox(height: 50.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'CVV: ${cardItem.cardCVV}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Text(
                              'Exp: ${cardItem.cardExp}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          cardItem.cardName,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.network(
                        cardItem.cardImageUrl,
                        height: 50.h,
                        width: 50.w,
                      ),
                      Text(
                        cardItem.cardType,
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}
