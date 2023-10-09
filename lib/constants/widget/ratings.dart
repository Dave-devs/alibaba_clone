import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ratings extends StatelessWidget {
  final double ratings;
const Ratings({ Key? key, required this.ratings }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: ratings,
      itemSize: 15,
      itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber)
    );
  }
}