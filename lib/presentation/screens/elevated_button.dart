import 'package:flutter/material.dart';

import '../widgets/Common_widgets.dart';

class elevated_button extends StatelessWidget {
  final Color col;
  const elevated_button({super.key, required this.col});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: col,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: () {},
      child: Common_widgets.text("BUY NOW", 20),
    );
  }
}
