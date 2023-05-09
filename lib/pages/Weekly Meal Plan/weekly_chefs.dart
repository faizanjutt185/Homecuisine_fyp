import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Chef to Customer/Dishess.dart';
import 'customer_weekly.dart';
import '../../widgets/big_text.dart';

class WeeklyChefs extends StatelessWidget {
  const WeeklyChefs({Key? key}) : super(key: key);


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
              text: '            WEEKLY CHEFS',
              color: Colors.white,
              size: 30,
            ),
          ],
        ),

        // centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('weeklychefs').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final WeeklyChefs = snapshot.data!.docs.map((doc) {
            return WeeklyChefData(
              chef_name: doc['chef_name'],
              PerMeal: doc['PerMeal'],
              costperdays: doc['costperdays'],
            );
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: WeeklyChefs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Faizans.jpg'),
                  ),
                  title: Text(
                    WeeklyChefs[index].chef_name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    WeeklyChefs[index].costperdays,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: Text(
                    WeeklyChefs[index].PerMeal,
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeeklyCustomer(),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WeeklyChefData {
  final String chef_name;
  final String costperdays;
  final String PerMeal;

  WeeklyChefData({
    required this.chef_name,
    required this.costperdays,
    required this.PerMeal,
  });
}