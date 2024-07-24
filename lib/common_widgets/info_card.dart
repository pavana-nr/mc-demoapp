import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const InfoCard(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: const TextStyle(
                fontFamily: 'sourceCodePro',
                fontSize: 20.0,
                color: Colors.teal),
          ),
        ),
      ),
    );
  }
}
