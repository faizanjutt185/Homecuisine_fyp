import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Cutomer to chef2/Dish.dart';
import 'CartItems.dart';

class OrderConfirmation extends StatelessWidget {
  final List<MapEntry<Dish, int>> cartItems;

  const OrderConfirmation({Key? key, required this.cartItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    cartItems.forEach((item) {
      double price = double.parse(item.key.price);
      totalPrice += price * item.value;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () => CartItems(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Confirmation",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                "Order Confirmed!",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                "Ordered Items:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  Dish dish = cartItems[index].key;
                  double price = double.parse(dish.price);
                  int quantity = cartItems[index].value;
                  return ListTile(
                    title: Text(
                      "${quantity} x ${dish.name}",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Text(
                      '\$${(price * quantity).toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
