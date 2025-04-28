import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_1/model_class/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  final List<CategoryClass> productList = [
    CategoryClass(
      categoryName: "Category 1",
      productList: [
        ProductClass(
          productImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtmYcY40iiqh4YoO8uIX96W4NIUfNJPc7pRw&s",
          price: 80.1,
        ),
        ProductClass(
          productImageUrl:
              "https://frankybros.com/wp-content/uploads/2023/02/custom-t-shirt-printing-in-ahmedabad-customized-t-shirts-online-india.webp",
          price: 90.1,
        ),
        ProductClass(
          productImageUrl:
              "https://www.arcprint.in/category/wp-content/uploads/2023/06/3-1-300x300.jpg",
          price: 180.1,
        ),
      ],
    ),

    CategoryClass(
      categoryName: "Category 2",
      productList: [
        ProductClass(
          productImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtmYcY40iiqh4YoO8uIX96W4NIUfNJPc7pRw&s",
          price: 50.5,
        ),
        ProductClass(
          productImageUrl:
              "https://www.arcprint.in/category/wp-content/uploads/2023/06/3-1-300x300.jpg",
          price: 150.5,
        ),
      ],
    ),

    CategoryClass(
      categoryName: "Category 3",
      productList: [
        ProductClass(
          productImageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtmYcY40iiqh4YoO8uIX96W4NIUfNJPc7pRw&s",
          price: 40.5,
        ),
        ProductClass(
          productImageUrl:
              "https://frankybros.com/wp-content/uploads/2023/02/custom-t-shirt-printing-in-ahmedabad-customized-t-shirts-online-india.webp",
          price: 50.5,
        ),
        ProductClass(
          productImageUrl:
              "https://www.arcprint.in/category/wp-content/uploads/2023/06/3-1-300x300.jpg",
          price: 120.5,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0.h),
                child: Text(
                  "Sneaky Man",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  final item = productList[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.categoryName,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            Text(
                              '${item.productList.length}',
                              style: TextStyle(fontSize: 16.sp),
                            ),

                            SizedBox(width: 2.w),

                            Icon(Icons.arrow_right_outlined),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),

                      SizedBox(
                        height: 270.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: item.productList.length,
                          itemBuilder: (context, index) {
                            final productItem = item.productList[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.h),
                              child: Card(
                                elevation: 2,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      productItem.productImageUrl,
                                      height: 150.h,
                                      width: 230.w,
                                      fit: BoxFit.cover,
                                    ),

                                    SizedBox(height: 10.h),

                                    SizedBox(
                                      width: 230.w,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.h,),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${productItem.price}',
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),

                                            SizedBox(height: 5.h),

                                            Text(
                                              productItem.productDescription,
                                              style: TextStyle(fontSize: 14.sp),
                                            ),

                                            SizedBox(height: 5.h),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: productItem.colorList.length,
                                                    itemBuilder: (context,index,) {
                                                      final colorItem = productItem.colorList[index];
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                          right: 5.h,
                                                        ),
                                                        height: 10.h,
                                                        width: 10.h,
                                                        decoration: BoxDecoration(
                                                          color: colorItem,
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 1.w,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),

                                                Container(
                                                  height: 30.h,
                                                  width: 30.h,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                      width: 1.w,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                  ),
                                                  child: Icon(Icons.add,),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 10.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
