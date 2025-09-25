import 'package:get/get.dart';

import '../model/reviews_model.dart';

class CategoryPopularDetailsController extends GetxController {
  //Details Carousel Slider //
  var currentPage = 0.obs;
  final List<String> images = [
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
    'https://www.figma.com/file/jNz7l61vmikt0kYyCBqz6X/image/7fb4ff2ac9294f42624fecf54617a99c024f8170',
  ];

  // Description Expanded false //
  var isExpanded = false.obs;

  void toggle() {
    isExpanded.value = !isExpanded.value;
  }

  var quantity = 1.obs;

  void increment() {
    quantity++;
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Reviews
  final List<ReviewsModel> reviewsList = [
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
    ReviewsModel(
      name: 'Mike Johnson',
      days: '2 days ago',
      rating: 5,
      title: '''Excellent quality sand. Perfect for my concrete project.''',
    ),
  ];
}
