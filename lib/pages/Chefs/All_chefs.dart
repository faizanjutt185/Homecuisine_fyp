import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Chef to Customer/Dishess.dart';
import '../../widgets/big_text.dart';

class AllChefsPage extends StatelessWidget {
  const AllChefsPage({Key? key}) : super(key: key);

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
              text: '            All CHEFS',
              color: Colors.white,
              size: 30,
            ),
          ],
        ),

        // centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chefs').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final chefs = snapshot.data!.docs.map((doc) {
            return Chef(
              name: doc['chef_name'],
              experience: doc['experience'],
              specialty: doc['qualifications'],
            );
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: chefs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Faizans.jpg'),
                  ),
                  title: Text(
                    chefs[index].name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    chefs[index].specialty,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: Text(
                    chefs[index].experience,
                    style: const TextStyle(fontSize: 16),
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
    );
  }
}

class Chef {
  final String name;
  final String specialty;
  final String experience;

  Chef({
    required this.name,
    required this.specialty,
    required this.experience,
  });
}