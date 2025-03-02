import 'package:flutter/material.dart';
import 'package:untitled/presentation/screens/Products.dart';
import 'package:untitled/presentation/widgets/Common_widgets.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  final List<Map<String, dynamic>> products = [
    {"image": 'lib/assets/brown.png', "title": "Office Code", "color": Color(0xFFD3A985),"price":"\$234","size":"12 cm"},
    {"image": 'lib/assets/blue.png', "title": "Belt Bag", "color": Color(0xFF2096F3),"price":"\$299","size":"12 cm"},
    {"image": 'lib/assets/purple.png', "title": "Hang Top", "color": Color(0xFFAE4D69),"price":"\$899","size":"8 cm"},
    {"image": 'lib/assets/cream.png', "title": "Old Fashion", "color": Color(0xFFF2C29B),"price":"\$999","size":"8 cm"},
    {"image": 'lib/assets/brown.png', "title": "Office Code", "color": Color(0xFFD3A985),"price":"\$234","size":"12 cm"},
    {"image": 'lib/assets/blue.png', "title": "Belt Bag", "color": Color(0xFF2096F3),"price":"\$299","size":"12 cm"},
    {"image": 'lib/assets/purple.png', "title": "Hang Top", "color": Color(0xFFAE4D69),"price":"\$899","size":"8 cm"},
    {"image": 'lib/assets/cream.png', "title": "Old Fashion", "color": Color(0xFFF2C29B),"price":"\$999","size":"8 cm"}
  ];

  int getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 3 : 2; // 3 columns for tablets, 2 for phones
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child:
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
            leading: Common_widgets.custom_icon(Icons.arrow_back_sharp,color: Colors.grey),
            actions: [
              Common_widgets.custom_icon(Icons.search,color: Colors.grey),
              SizedBox(width: 10,),
              Common_widgets.custom_icon(Icons.shopping_cart_outlined,color: Colors.grey),
              SizedBox(width: 10,),
            ],
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 80,left: 20,bottom: 20), // Adjust as needed
              child: Text(
                "Women",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            bottom:
            TabBar(
              indicatorColor: Colors.black,
              tabs: <Widget>[

              Common_widgets.text("Hand Bag", 15,color: Colors.black),
                Common_widgets.text("Jewellery", 15,color: Colors.black),
                Common_widgets.text("Footware", 15,color: Colors.black),
                Common_widgets.text("Dresses", 15,color: Colors.black),
            ],
            )
        ),
        body: SafeArea(
          child: TabBarView(
              children:<Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(context),
                      crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 240
                  ), itemCount: products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsPage(
                                image: products[index]['image'],
                                title: products[index]['title'],
                                size: products[index]['size'],
                                col: products[index]['color'],
                                price: products[index]['price'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: products[index]['color'],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                products[index]['image'],
                                fit: BoxFit.contain,  // Prevents unexpected cropping
                              ),
                            ),
                          ),


                          Text(
                            products[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                          ),

                          Common_widgets.text(products[index]['price'], 15,color: Colors.black,fontweight: FontWeight.w500)
                          // Text below the circle
                          ],
                          ),
                        );
                          },
                  ),
                ),
          
                Center(child: Text("Nothing to show"),),
                Center(child: Text("Nothing to show"),),
                Center(child: Text("Nothing to show"),),
              ] ),
        ),
      ),
    );
  }
}
