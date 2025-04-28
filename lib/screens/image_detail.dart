import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDetailScreen extends StatefulWidget {
  const ImageDetailScreen({super.key});

  @override
  State<ImageDetailScreen> createState() => _IMageDetailScreenState();
}

class _IMageDetailScreenState extends State<ImageDetailScreen> {

  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                setState(() {
                  isZoomed = !isZoomed;
                });
              },
              child: AnimatedContainer(
                duration: Duration(microseconds:1000),
                curve: Curves.easeInOut,
                child: InteractiveViewer(
                  panEnabled: false, // Disable panning if you only want zoom
                  maxScale: 5.0,
                  minScale: 1.0,
                  child: Image.network(
                    "https://i.pinimg.com/736x/80/6d/0f/806d0fae5280552679e633bea886c08c.jpg",
                    height: isZoomed ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * 0.8,
                    width:isZoomed ? MediaQuery.of(context).size.width :  MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
