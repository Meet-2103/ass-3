import 'package:flutter/material.dart';
import 'package:untitled/core/constants/color.dart';
import 'package:untitled/presentation/screens/App_bar.dart';
import 'package:untitled/presentation/screens/elevated_button.dart';
import 'package:untitled/presentation/screens/product_details.dart';
import 'package:untitled/presentation/screens/radio_button.dart';
import 'package:untitled/presentation/widgets/Common_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  final String price;
  final String image;
  final String size;
  final Color col;

  const ProductsPage({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.size,
    required this.col,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Future<Map<String, dynamic>> fetchData() async {
    await Future.delayed(Duration(seconds: 2));

    return {
      'title': widget.title,
      'price': widget.price,
      'image': widget.image,
      'size': widget.size,
      'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: widget.col,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Common_widgets.custom_icon(Icons.arrow_back_sharp, size: 30),
          ),
          actions: [
            Common_widgets.custom_icon(Icons.search, size: 30),
            SizedBox(width: 9),
            Common_widgets.custom_icon(Icons.shopping_cart_outlined, size: 30),
            SizedBox(width: 9),
          ],
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              var data = snapshot.data!;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  product_Details(title: data['title'], price: data['price'], col: widget.col),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.35,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.sizeOf(context).height * 0.65,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Common_widgets.text("Color", 15, color: Colors.black, fontweight: FontWeight.w300),
                              SizedBox(width: 160),
                              Common_widgets.text("Size", 15, color: Colors.black, fontweight: FontWeight.w300),
                            ],
                          ),
                          Row(
                            children: [
                              ColorRadioButton(),
                              SizedBox(width: 100),
                              Common_widgets.text(data['size'], color: Colors.black, 20),
                            ],
                          ),
                          SizedBox(height: 20),
                          Common_widgets.text(data['description'], 15, color: Colors.black, flag: true, fontweight: FontWeight.w300),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      decoration:BoxDecoration(
                                        border: Border.all(color: AppColors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Common_widgets.custom_icon(Icons.remove, color: AppColors.grey, size: 25)),
                                  SizedBox(width: 5),
                                  Text("01", style: TextStyle(fontSize: 20)),
                                  SizedBox(width: 5),
                                  Container(
                                      decoration:BoxDecoration(
                                        border: Border.all(color: AppColors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Common_widgets.custom_icon(Icons.add, color: AppColors.grey, size: 25)),
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red, width: 1),
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Icon(Icons.favorite,color: AppColors.white,),

                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: widget.col, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.add_shopping_cart, color: widget.col),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: elevated_button(col: widget.col),
                              ),
                            ],
                          ),
                          SizedBox(height: 90)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: MediaQuery.of(context).size.width * 0.40,
                    child: Image.asset(data['image'], fit: BoxFit.contain, width: 300, height: 300),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
