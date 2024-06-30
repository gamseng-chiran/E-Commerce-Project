import 'package:e_commerce/data/models/create_review_model.dart';
import 'package:e_commerce/prsentation/screens/create_review_screen.dart';
import 'package:e_commerce/prsentation/state_holders/add_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  final String productId;

  ReviewListScreen({required this.productId});

  @override
  _ReviewListScreenState createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  late Future<List<ReviewModel>> _reviewsFuture;
  final AddReviewController _addReviewController = AddReviewController();

  @override
  void initState() {
    super.initState();
    _reviewsFuture = _addReviewController.fetchReviews(widget.productId) as Future<List<ReviewModel>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<ReviewModel>>(
        future: _reviewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No reviews found'));
          } else {
            List<ReviewModel> reviews = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${reviews[index].firstName} ${reviews[index].lastName}'),
                        subtitle: Text(reviews[index].review ?? ''),
                        onTap: () {
                          // Navigate to Create Review Screen with existing review data
                          Get.to(() => CreateReviewScreen(
                            productId: widget.productId,
                            review: reviews[index],
                          ));
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Reviews (${reviews.length})'),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Create Review Screen
          Get.to(() => CreateReviewScreen(productId: widget.productId));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}