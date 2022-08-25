import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  StarRating({Key? key}) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Icon(
            Icons.star,
            color: _rating >= 1 ? Colors.orange : Colors.grey,
          ),
          onTap: () => rate(1),
        ),
        GestureDetector(
          child: Icon(
            Icons.star,
            color: _rating >= 2 ? Colors.orange : Colors.grey,
          ),
          onTap: () => rate(2),
        ),
        GestureDetector(
          child: Icon(
            Icons.star,
            color: _rating >= 3 ? Colors.orange : Colors.grey,
          ),
          onTap: () => rate(3),
        ),
        GestureDetector(
          child: Icon(
            Icons.star,
            color: _rating >= 4 ? Colors.orange : Colors.grey,
          ),
          onTap: () => rate(4),
        ),
        GestureDetector(
          child: Icon(
            Icons.star,
            color: _rating >= 5 ? Colors.orange : Colors.grey,
          ),
          onTap: () => rate(5),
        ),
        SizedBox(
          width: 10,
        ),
        Text("${_rating.toDouble()}/5.0")
      ],
    );
  }
}
