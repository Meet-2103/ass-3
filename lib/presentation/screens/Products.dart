import 'package:flutter/material.dart';
import 'package:untitled/presentation/widgets/Common_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  final String price;
  final String image;
  final String size;
  final Color col;
  const ProductsPage({super.key,required this.title, required this.price,required this.image, required this.size,required this.col});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}
//widgets parameters  widget title price image size
class _ProductsPageState extends State<ProductsPage> {

  Widget colorOption(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 22,
      height: 22,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Colors.black)),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
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
            onTap: (){
              Navigator.pop(context);
            },
              child: Common_widgets.custom_icon(Icons.arrow_back_sharp,size: 30)),       //check
          actions: [
            Common_widgets.custom_icon(Icons.search,size: 30),
            SizedBox(width: 9,),
            Common_widgets.custom_icon(Icons.shopping_cart_outlined,size: 30),
            SizedBox(width: 9,),
          ],
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children:[
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: widget.col,
              alignment: Alignment.topLeft ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Common_widgets.text("Aristocratic Hand Bag",15,fontweight: FontWeight.w300),
                  Common_widgets.text(widget.title,35,fontweight: FontWeight.bold),
                  SizedBox(height: 130,),
                  Common_widgets.text("Price", 13,fontweight: FontWeight.w300),
                  Common_widgets.text(widget.price, 40),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.35,
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.sizeOf(context).height*0.65,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Common_widgets.text("Color", 15,color: Colors.black,fontweight: FontWeight.w300),
                      SizedBox(width: 160,),
                      Common_widgets.text("Size", 15,color: Colors.black,fontweight: FontWeight.w300),
                    ],),
                    Row(
                      children: [
                        colorOption(Colors.blue),
                        colorOption(Colors.orange),
                        colorOption(Colors.grey),
      
                        SizedBox(width: 100,),
                        Common_widgets.text(widget.size,color: Colors.black, 20),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Common_widgets.text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 15,color: Colors.black,flag: true,fontweight: FontWeight.w300),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Common_widgets.custom_icon(Icons.remove_circle_outline,color: Colors.black,size:25),
                            SizedBox(width: 5,),
                            Text("01", style: TextStyle(fontSize: 20)),
                            SizedBox(width: 5,),
                            Common_widgets.custom_icon(Icons.add_circle_outline,color: Colors.black,size:25),
                          ],
                        ),

                        Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,

                          decoration: BoxDecoration(

                            border: Border.all(
                              color: Colors.red, // Border color
                              width: 1, // Border width
                            ),
                            shape: BoxShape.circle,
                            color:  Colors.red, // Same as "BUY NOW" button color
                          ),
                          child: IconButton(icon: Icon(Icons.favorite, color: Colors.white), onPressed: () {}),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [ // Add some spacing
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: widget.col, // Border color
                              width: 1, // Border width
                            ),
                            shape: BoxShape.circle,
                            color:  Colors.white, // Same as "BUY NOW" button color
                          ),
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart_outlined, color: widget.col),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.col,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            onPressed: () {},
                            child: Common_widgets.text("BUY NOW", 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 90,)
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.15,
              left: MediaQuery.of(context).size.width*0.40,
              child: Image.asset(widget.image,fit: BoxFit.cover,width: 250,height: 250,),
              // child: Image.network(widget.image,fit: BoxFit.cover,),
            ),
                  ]
        ),
      
      
      ),
    );
  }
}
//machine both containers color i have manually colobrated