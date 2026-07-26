import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      "name": "Luxury Dress",
      "price": "Rs. 24,990",
      "image": "assets/images/products/luxury_dress.jpg",
    },
    {
      "name": "Leather Jacket",
      "price": "Rs. 18,990",
      "image": "assets/images/products/leather_jacket.jpg",
    },
    {
      "name": "Running Shoes",
      "price": "Rs. 15,990",
      "image": "assets/images/products/classic_shoes.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        centerTitle: true,
      ),

      body: wishlistItems.isEmpty
          ? const Center(
              child: Text(
                "Your wishlist is empty",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),

                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item["image"],
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      item["name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        item["price"],
                        style: const TextStyle(
                          color: Color.fromRGBO(245, 107, 119, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == "cart") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${item["name"]} added to cart",
                              ),
                            ),
                          );
                        }

                        if (value == "remove") {
                          setState(() {
                            wishlistItems.removeAt(index);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Removed from wishlist"),
                            ),
                          );
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: "cart",
                          child: Text("Move to Cart"),
                        ),
                        PopupMenuItem(
                          value: "remove",
                          child: Text("Remove"),
                        ),
                      ],
                    ),

                    onTap: () {
                      Navigator.pushNamed(context, "/product-details");
                    },
                  ),
                );
              },
            ),
    );
  }
}