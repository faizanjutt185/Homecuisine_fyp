import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/big_text.dart';

class DiseaseSearchScreen extends StatefulWidget {
  @override
  _DiseaseSearchScreenState createState() => _DiseaseSearchScreenState();
}

class _DiseaseSearchScreenState extends State<DiseaseSearchScreen> {
  final TextEditingController _diseaseController = TextEditingController();
  List<String> _foods = [];

  Future<void> _searchDisease(String disease) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('diseases')
        .where('disease_name', isEqualTo: disease.toLowerCase())
        .get();

    if (snapshot.size > 0) {
      final List<dynamic> foods = snapshot.docs.first.get('foods');
      setState(() {
        _foods = List<String>.from(foods);
      });
    } else {
      setState(() {
        _foods = [];
      });
    }
  }

  Widget _buildFoodItem(String foodName) {
    IconData icon;
    Color iconColor;
    if (foodName.contains('healthy')) {
      icon = Icons.check;
      iconColor = Colors.green;
    } else if (foodName.contains('unhealthy')) {
      icon = Icons.clear;
      iconColor = Colors.red;
    } else {
      icon = Icons.error;
      iconColor = Colors.grey;
    }
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
        ),
        title: Text(foodName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.deepOrange,
        titleSpacing: 0,
        title: Column(
          children: [
            Bigtext(
              text: 'Suggest for Foods on Disease',
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _diseaseController,
              decoration: InputDecoration(
                labelText: 'Enter a Disease',
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                ),
                suffixIcon: IconButton(
                  onPressed: () => _diseaseController.clear(),
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _searchDisease(_diseaseController.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
              ),
              child: const Text('Search'),
            ),
            SizedBox(height: 16),
            if (_foods.isEmpty)
              Center(
                child: Text(
                  'No results found',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: _foods.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildFoodItem(_foods[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}