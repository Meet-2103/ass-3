import 'package:flutter/material.dart';

import '../widgets/Common_widgets.dart';

class Custom_Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 80,
        leading: Common_widgets.custom_icon(Icons.arrow_back_sharp,color: Colors.grey),
        actions: [
          Common_widgets.custom_icon(Icons.search,color: Colors.grey),
          SizedBox(width: 10,),
          Common_widgets.custom_icon(Icons.shopping_cart_outlined,color: Colors.grey),
          SizedBox(width: 10,),
        ],
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 80,left: 20,bottom: 20),
          child: Text(
            "Women",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        bottom:
        TabBar(
          dividerHeight: 0,
          indicatorColor: Colors.black,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.black),
            insets: EdgeInsets.only(right: 30.0),
          ),
          tabs: <Widget>[
            Common_widgets.text("Hand Bag", 15,color: Colors.black),
            Common_widgets.text("Jewellery", 15,color: Colors.black),
            Common_widgets.text("Footware", 15,color: Colors.black),
            Common_widgets.text("Dresses", 15,color: Colors.black),
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);

}

