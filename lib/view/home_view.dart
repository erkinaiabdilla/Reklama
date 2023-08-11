import 'package:flutter/material.dart';
import 'package:reklama/add_product/add_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeView'),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProduct(),
                  ),
                );
              },
              icon: const Icon(Icons.publish),
              label: const Text('Баштоо'))
        ],
      ),
    );
  }
}
