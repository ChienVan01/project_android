import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRatingDialog(context, String img) {
  showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (context) {
      return RatingDialog(
        title: const Text(
          'Rate Us',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        starColor: primaryColor,
        message: const Text(
          'Tap a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        // your app's logo?
        image: Image.asset('assets/images/product/$img'),
        submitButtonText: 'Submit',
        commentHint: 'Do you like it?',
        onCancelled: () {},
        onSubmitted: (response) {
          //print('rating: ${response.rating}, comment: ${response.comment}');
          if (response.rating >= 4) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Thanks for your rating! Hope you enjoy'),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("We're sorry for disappointing you"),
            ));
          }
        },
      );
    },
  );
}