import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        "id": "#LUC1001",
        "date": "12 July 2026",
        "total": "LKR 24,990",
        "status": "Delivered",
      },
      {
        "id": "#LUC1002",
        "date": "10 July 2026",
        "total": "LKR 15,990",
        "status": "Shipped",
      },
      {
        "id": "#LUC1003",
        "date": "08 July 2026",
        "total": "LKR 32,500",
        "status": "Processing",
      },
    ];

    Color getStatusColor(String status) {
      switch (status) {
        case "Delivered":
          return Colors.green;
        case "Shipped":
          return Colors.orange;
        case "Processing":
          return Colors.blue;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Order History"), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color.fromRGBO(245, 107, 119, 1),
                child: Icon(Icons.shopping_bag, color: Colors.white),
              ),
              title: Text(
                order["id"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${order["date"]}\nTotal: ${order["total"]}"),
              isThreeLine: true,
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    order["status"],
                    style: TextStyle(
                      color: getStatusColor(order["status"]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, "/order-details");
              },
            ),
          );
        },
      ),
    );
  }
}
