import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  static const Color primaryColor = Color(0xFFD4AF37);

  Widget dashboardCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: color.withOpacity(.15),
                child: Icon(icon, color: color),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("LUCCO Admin Dashboard"),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Dashboard Overview",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                infoCard(
                  "Products",
                  "120",
                  Icons.inventory_2,
                  Colors.blue,
                ),
                const SizedBox(width: 10),
                infoCard(
                  "Orders",
                  "56",
                  Icons.shopping_cart,
                  Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                infoCard(
                  "Customers",
                  "240",
                  Icons.people,
                  Colors.purple,
                ),
                const SizedBox(width: 10),
                infoCard(
                  "Revenue",
                  "LKR 2.8M",
                  Icons.payments,
                  Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              "Management",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: .95,

              children: [

                dashboardCard(
                  context: context,
                  icon: Icons.inventory,
                  title: "Products",
                  subtitle: "Manage products",
                  color: Colors.blue,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.category,
                  title: "Categories",
                  subtitle: "Manage categories",
                  color: Colors.orange,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.shopping_bag,
                  title: "Orders",
                  subtitle: "View customer orders",
                  color: Colors.green,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.people,
                  title: "Customers",
                  subtitle: "Registered users",
                  color: Colors.purple,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.discount,
                  title: "Coupons",
                  subtitle: "Discount offers",
                  color: Colors.red,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.bar_chart,
                  title: "Reports",
                  subtitle: "Sales analytics",
                  color: Colors.teal,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.notifications,
                  title: "Notifications",
                  subtitle: "Send alerts",
                  color: Colors.indigo,
                  onTap: () {},
                ),

                dashboardCard(
                  context: context,
                  icon: Icons.settings,
                  title: "Settings",
                  subtitle: "Application settings",
                  color: Colors.grey,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}