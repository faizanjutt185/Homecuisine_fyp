/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Search_Rsult_page.dart';
void searchFoods(BuildContext context, String query) async {
  if (query.isNotEmpty) {
    final foodRef = FirebaseFirestore.instance.collection('dishes');
    final result = await foodRef.where('name', isEqualTo: query).get();
    if (result.docs.isNotEmpty) {
      var my_library;
      final dishes = result.docs.map((doc) => my_library.Dish.fromSnapshot(doc)).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(dishes: dishes, foods: []),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No results found.'),
        ),
      );
    }
  }
}*/
