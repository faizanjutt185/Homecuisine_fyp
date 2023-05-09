import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homie_cuisine/widgets/big_text.dart';
import 'package:provider/provider.dart';

import '../../Cutomer to chef2/Dish.dart';
import '../Cart/CartItems.dart';
import '../Cart/CartProvider.dart';
import '../Cart/Cart_Class.dart';

class PopulaarFoodDetail extends StatefulWidget {
  final Dish dish;
  final String? imageUrl;

  PopulaarFoodDetail({required this.dish, this.imageUrl});

  @override
  _PopularFoodDetailState createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopulaarFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Bigtext(text: widget.dish.name, size: 30, color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: widget.imageUrl != null
                    ? Image.network(
                  widget.imageUrl!,
                  fit: BoxFit.cover,
                )
                    : Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey[500]),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.dish.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.dish.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Text(
              '\$${widget.dish.price}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addItem(widget.dish);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartItems()),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
