import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final String rating;

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 4),
        Text(rating),
      ],
    );
  }
}
