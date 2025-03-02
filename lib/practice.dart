import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aristocratic Hand Bag", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 5),
            Text("Belt Bag", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("\$234", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown)),
            SizedBox(height: 20),
            Center(
              child: Image.asset("assets/bag.png", height: 150), // Replace with actual image
            ),
            SizedBox(height: 20),
            Text("Color"),
            Row(
              children: [
                colorOption(Colors.blue),
                colorOption(Colors.orange),
                colorOption(Colors.grey),
              ],
            ),
            SizedBox(height: 10),
            Text("Size"),
            Text("8 cm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: () {}),
                    Text("01", style: TextStyle(fontSize: 18)),
                    IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {}),
                  ],
                ),
                IconButton(icon: Icon(Icons.favorite_border, color: Colors.red), onPressed: () {}),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text("BUY NOW", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorOption(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Colors.black)),
    );
  }
}
