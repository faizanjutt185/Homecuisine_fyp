import 'package:flutter/material.dart';
import 'customer_weekly.dart';

class SelectedDishesPage extends StatelessWidget {
  final List<WeeklyDishesData> selectedDishes;

  const SelectedDishesPage({Key? key, required this.selectedDishes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    for (final dish in selectedDishes) {
      totalPrice += double.parse(dish.price);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Dishes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedDishes.length,
              itemBuilder: (BuildContext context, int index) {
                final dish = selectedDishes[index];
                return ListTile(
                  title: Text(dish.dishname),
                  subtitle: Text('${dish.chefname} - ${dish.price}'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Faizans.jpg'),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:'),
                Text('\$${totalPrice.toStringAsFixed(2)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
