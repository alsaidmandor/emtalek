import 'package:flutter/material.dart';

class PlaceholderTab extends StatelessWidget {
  const PlaceholderTab(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(child: Text(title)));
  }
}
