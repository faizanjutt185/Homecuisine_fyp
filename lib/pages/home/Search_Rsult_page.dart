/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homie_cuisine/Chef%20pages/Dashboard/Chef_Upload.dart';


class SearchResultsPage extends StatelessWidget {
  final List<Dish> foods;

  const SearchResultsPage({Key? key, required this.foods, required List dishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return ListTile(
            title: Text(food.name),
            subtitle: Text(food.description),
            trailing: Text(food.price),
          );
        },
      ),
    );
  }
}

class Dish {
  final String name;
  final String description;
  final String price;
  final String? image;

  Dish({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }

  static Dish fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Dish(
      name: data['name'],
      description: data['description'],
      price: data['price'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}

void searchFoods(BuildContext context, String query) async {
  if (query.isNotEmpty) {
    final foodRef = FirebaseFirestore.instance.collection('dishes');
    final result = await foodRef.where('name', isEqualTo: query).get();
    if (result.docs.isNotEmpty) {
      final foods = result.docs.map((doc) => Dish.fromSnapshot(doc)).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(foods: foods, dishes: [],),
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
