import 'dart:io';

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color color;
  final String title;
  final String path;

  const CategoryCard({
    Key? key,
    required this.color,
    required this.title,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: path == ""
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: color,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                )
              ],
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                )
              ],
              image: DecorationImage(
                image: FileImage(File(path)),
                fit: BoxFit.cover,
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
