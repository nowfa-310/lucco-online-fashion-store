import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "Women", "icon": Icons.checkroom, "color": Colors.pink},
      {"name": "Men", "icon": Icons.man, "color": Colors.blue},
      {"name": "Kids", "icon": Icons.child_care, "color": Colors.orange},
      {"name": "Shoes", "icon": Icons.hiking, "color": Colors.green},
      {"name": "Bags", "icon": Icons.shopping_bag, "color": Colors.purple},
      {"name": "Beauty", "icon": Icons.face, "color": Colors.teal},
      {"name": "Jewelry", "icon": Icons.diamond, "color": Colors.amber},
      {"name": "Watches", "icon": Icons.watch, "color": Colors.brown},
      {"name": "Sports", "icon": Icons.sports_soccer, "color": Colors.indigo},
      {"name": "Accessories", "icon": Icons.style, "color": Colors.grey},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search categories...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: categories.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                ),

                itemBuilder: (context, index) {
                  final category = categories[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(20),

                    onTap: () {
                      Navigator.pushNamed(context, "/product-list");
                    },

                    child: Card(
                      elevation: 3,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: category["color"].withOpacity(
                              0.15,
                            ),

                            child: Icon(
                              category["icon"],
                              size: 35,
                              color: category["color"],
                            ),
                          ),

                          const SizedBox(height: 15),

                          Text(
                            category["name"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Shop Now",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
