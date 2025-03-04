import 'package:flutter/material.dart';

import '../widgets/Common_widgets.dart';

class product_Details extends StatelessWidget {
  final String title;
  final String price;
  final Color col;
  const product_Details({super.key, required this.title, required this.price, required this.col});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: col,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Common_widgets.text("Aristocratic Hand Bag", 15, fontweight: FontWeight.w300),
          Common_widgets.text(title, 35, fontweight: FontWeight.bold),
          SizedBox(height: 130),
          Common_widgets.text("Price", 13, fontweight: FontWeight.w300),
          Common_widgets.text(price, 40),
        ],
      ),
    );
  }
}
