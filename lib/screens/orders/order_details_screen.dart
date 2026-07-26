import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.receipt_long,
                  color: Color.fromRGBO(245, 107, 119, 1),
                ),
                title: const Text(
                  "Order ID: #LUC1001",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("12 July 2026\nStatus: Delivered"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Products",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
  child: ListTile(
    leading: Image.asset(
      "assets/images/products/luxury_dress.jpg",
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    ),
    title: const Text("Luxury Dress"),
    subtitle: const Text("Qty: 1"),
    trailing: const Text(
  "Rs. 5,990.00",
  style: TextStyle(
    color: Color.fromRGBO(245, 107, 119, 1),
    fontWeight: FontWeight.bold,
  ),
),
              ),
            ),

            Card(
  child: ListTile(
    leading: Image.asset(
      "assets/images/products/leather_jacket.jpg",
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    ),
    title: const Text("Leather Jacket"),
    subtitle: const Text("Qty: 1"),
    trailing: const Text(
      "Rs. 12,990.00",
      style: TextStyle(
        color: Color.fromRGBO(245, 107, 119, 1),
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),


            const SizedBox(height: 20),

            const Text(
              "Shipping Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Nowfa Begum"),
                subtitle: Text("123 Main Street,\nTrincomalee, Sri Lanka"),
              ),
            ),

            const SizedBox(height: 20),

            const Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal"),
            Text("Rs. 18,980.00"),
          ],
        ),

        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Delivery"),
            Text("Rs. 350.00"),
          ],
        ),

        Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "Rs. 19,330.00",
              style: TextStyle(
                color: const Color.fromRGBO(245, 107, 119, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(245, 107, 119, 1),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
