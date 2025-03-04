import 'package:flutter/material.dart';

class ColorRadioButton extends StatefulWidget {
  @override
  _ColorRadioButtonState createState() => _ColorRadioButtonState();
}

class _ColorRadioButtonState extends State<ColorRadioButton> {
  Color? selectedColor;

  final List<Color> colors = [Colors.red, Colors.blue, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = color;
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 8),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: selectedColor == color ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
            // child: null,

          ),
        );
      }).toList(),
    );
  }
}
