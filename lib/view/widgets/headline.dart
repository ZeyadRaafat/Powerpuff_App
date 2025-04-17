import 'package:flutter/material.dart';

class headlinee extends StatefulWidget {
  const headlinee({super.key, required this.sectext, required this.firtext});
  final String firtext;
  final String sectext;

  @override
  State<headlinee> createState() => _headlinee();
}

class _headlinee extends State<headlinee> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.firtext,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text(widget.sectext,
              style: TextStyle(color: Theme.of(context).primaryColor)),
        ),
      ],
    );
  }
}
