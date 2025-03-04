import 'package:flutter/material.dart';
import 'package:untitled/core/constants/color.dart';
import '../widgets/Common_widgets.dart';
import 'Products.dart';

class Tab_Bar extends StatelessWidget {
  Tab_Bar({super.key});

  int getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600 ? 3 : 2;
  }

  final List<Map<String, dynamic>> products = [
    {"image": 'lib/assets/blue1.png', "title": "Office Code", "color": AppColors.blue_one,"price":"\$234","size":"12 cm"},
    {"image": 'lib/assets/blue.png', "title": "Belt Bag", "color": AppColors.blue,"price":"\$234","size":"12 cm"},
    {"image": 'lib/assets/purple.png', "title": "Hang Top", "color": AppColors.purple,"price":"\$234","size":"8 cm"},
    {"image": 'lib/assets/cream.png', "title": "Old Fashion", "color": AppColors.cream,"price":"\$234","size":"8 cm"},
    {"image": 'lib/assets/blue1.png', "title": "Office Code", "color": AppColors.blue_one,"price":"\$234","size":"12 cm"},
    {"image": 'lib/assets/blue.png', "title": "Belt Bag", "color": AppColors.blue,"price":"\$234","size":"12 cm"},
    {"image": 'lib/assets/purple.png', "title": "Hang Top", "color": AppColors.purple,"price":"\$234","size":"8 cm"},
    {"image": 'lib/assets/cream.png', "title": "Old Fashion", "color": AppColors.cream,"price":"\$234","size":"8 cm"},
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Text(
                  products[index]['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                Common_widgets.text(products[index]['price'], 15,color: Colors.black,fontweight: FontWeight.w500)
                // Text below the circle
              ],
            ),
          );
        },
      ),
    );
  }
}
