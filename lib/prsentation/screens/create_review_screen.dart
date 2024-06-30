import 'package:e_commerce/data/models/create_review_model.dart';
import 'package:e_commerce/prsentation/state_holders/add_review_controller.dart';
import 'package:e_commerce/prsentation/state_holders/create_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CreateReviewScreen extends StatefulWidget {
  final String productId;
  final ReviewModel? review;

  CreateReviewScreen({required this.productId, this.review});

  @override
  _CreateReviewScreenState createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _reviewController = TextEditingController();
  final CreateReviewController _createReviewController = CreateReviewController();

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      _firstNameController.text = widget.review!.firstName!;
      _lastNameController.text = widget.review!.lastName!;
      _reviewController.text = widget.review!.review!;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Write Review',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                ReviewModel newReview = ReviewModel(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  review: _reviewController.text,
                );

                bool success = await _createReviewController.createReview(widget.productId, newReview);

                if (success) {
                  Get.back(); // Navigate back to the review list screen
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to submit review')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}