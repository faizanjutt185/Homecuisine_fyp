import 'package:flutter/material.dart';
import 'package:homie_cuisine/Cutomer%20to%20chef2/Dish.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../../Chef pages/Dashboard/Pending_orders.dart';
import '../Chat/chatSCREEN.dart';
import 'CartProvider.dart';
import 'OrderConfirmation.dart';

class CartItems extends StatelessWidget {
 // const CartItems({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    var cartItems = cartProvider.cart.items.entries.toList();

    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${cartProvider.cart.totalAmount.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextButton(
              onPressed: () {
                List<Dish> dishes = [];
                for (var item in cartItems) {
                  Dish dish = item.key;
                  int quantity = item.value;
                  for (int i = 0; i < quantity; i++) {
                    dishes.add(dish);
                  }
                }

                // Add the dishes to the list of pending orders
                Provider.of<CartProvider>(context, listen: false);

                // Navigate to the order confirmation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderConfirmation(cartItems: cartItems),
                  ),
                ).then((_) {
                  // After returning from the order confirmation page, navigate to the pending orders page
                  Navigator.pop(context); // Pop the CartItems page after navigating back from OrderConfirmation
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PendingOrders(),
                    ),
                  );
                });
              },
              child: Text(
                "Check Out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(conversationId: 'faizan', username: 'customer',),));
          },
              icon: Icon(Icons.chat))
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          Dish dish = cartItems[index].key;
          int quantity = cartItems[index].value;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(dish.image.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        dish.description,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$${dish.price}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                cartProvider.removeItem(dish),
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                          SizedBox(width: 10),
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            onPressed: () => cartProvider.addItem(dish),
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => cartProvider.removeItemCompletely(dish),
                  icon: Icon(Icons.close_rounded),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
