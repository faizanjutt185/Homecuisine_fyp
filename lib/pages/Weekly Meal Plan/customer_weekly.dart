import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Chef to Customer/Dishess.dart';
import '../../../widgets/big_text.dart';

class WeeklyCustomer extends StatefulWidget {
  const WeeklyCustomer({Key? key}) : super(key: key);

  @override
  _WeeklyCustomerState createState() => _WeeklyCustomerState();
}

class _WeeklyCustomerState extends State<WeeklyCustomer> {
  List<WeeklyDishesData> _selectedDishes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.deepOrange,
        titleSpacing: 0,
        title: Bigtext(
          text: '       WEEKLY SCHEDULE',
          color: Colors.white,
          size: 30,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
        FirebaseFirestore.instance.collection('weeklydishes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final weeklyChefs = snapshot.data!.docs.map((doc) {
            return WeeklyDishesData(
              chefname: doc['chefname'],
              dishname: doc['dishname'],
              day: doc['day'],
              price: doc['price'],
            );
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: weeklyChefs.length,
            itemBuilder: (BuildContext context, int index) {
              final dish = weeklyChefs[index];
              return Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Faizans.jpg'),
                  ),
                  title: Text(
                    dish.chefname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        'Dish: ${dish.dishname}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Day: ${dish.day}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 1),
                      Text(
                        'Price: ${dish.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 24, // replace with desired height
                        child: Checkbox(
                          value: _selectedDishes.contains(dish),
                          onChanged: (bool? selected) {
                            setState(() {
                              if (selected ?? false) {
                                _selectedDishes.add(dish);
                              } else {
                                _selectedDishes.remove(dish);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerUI(),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: _selectedDishes.isNotEmpty
          ? FloatingActionButton.extended(
        onPressed: () {
          // handle order confirmation here
        },
        label: const Text('Confirm Order'),
        icon: Icon(Icons.check),
      )
          : null,
    );
  }
}

class WeeklyDishesData {
  final String chefname;
  final String dishname;
  final String day;
  final String price;

  WeeklyDishesData({
    required this.chefname,
    required this.dishname,
    required this.day,
    required this.price,
  });
}
