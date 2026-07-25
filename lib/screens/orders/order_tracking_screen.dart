import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Tracking"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              child: ListTile(
                leading: Icon(Icons.local_shipping, color: Color.fromRGBO(245, 107, 119, 1)),
                title: Text(
                  "Order #LUC1001",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Estimated Delivery: 15 July 2026"),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Tracking Status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            _buildStep("Order Placed", "12 Jul 2026 - 09:00 AM", true),

            _buildStep("Order Confirmed", "12 Jul 2026 - 10:30 AM", true),

            _buildStep("Packed", "13 Jul 2026 - 08:00 AM", true),

            _buildStep("Shipped", "13 Jul 2026 - 03:00 PM", true),

            _buildStep("Out for Delivery", "Expected Tomorrow", false),

            _buildStep("Delivered", "Pending", false),
          ],
        ),
      ),
    );
  }

  static Widget _buildStep(String title, String subtitle, bool completed) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: completed ? Colors.green : Colors.grey.shade300,
        child: Icon(
          completed ? Icons.check : Icons.radio_button_unchecked,
          color: Colors.white,
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
