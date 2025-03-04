import 'package:flutter/material.dart';
import 'package:untitled/presentation/screens/Custom_AppBar.dart';
import 'package:untitled/presentation/screens/Tab_Bar.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child:
      Scaffold(
        appBar: Custom_Appbar(),
        body: SafeArea(
          child: TabBarView(
              children:<Widget>[
                Tab_Bar(),
                Center(child: Text("Nothing to show"),),
                Center(child: Text("Nothing to show"),),
                Center(child: Text("Nothing to show"),),
              ] ),
        ),
      ),
    );
  }
}
