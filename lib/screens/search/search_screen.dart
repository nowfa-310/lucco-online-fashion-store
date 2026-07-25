import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allProducts = [
  {
    "name": "Luxury Dress",
    "category": "Women's Fashion",
    "price": "LKR 24,990",
    "image": "assets/images/products/luxury_dress.jpg",
  },
  {
    "name": "Leather Jacket",
    "category": "Men's Fashion",
    "price": "LKR 18,990",
    "image": "assets/images/products/leather_jacket.jpg",
  },
  {
    "name": "Running Shoes",
    "category": "Shoes",
    "price": "LKR 15,990",
    "image": "assets/images/products/Classic_shoes.jpg",
  },
  {
    "name": "Luxury Handbag",
    "category": "Bags",
    "price": "LKR 21,990",
    "image": "assets/images/products/luxury_handbag.jpg",
  },
  {
    "name": "Gold Watch",
    "category": "Watches",
    "price": "LKR 34,990",
    "image": "assets/images/products/gold_watch.jpg",
  },
  {
    "name": "Diamond Ring",
    "category": "Jewelry",
    "price": "LKR 49,990",
    "image": "assets/images/products/diamond_ring.jpg",
  },
];

  List<Map<String, String>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _searchProducts(String keyword) {
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        return product["name"]!.toLowerCase().contains(keyword.toLowerCase()) ||
            product["category"]!.toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Search Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              controller: _searchController,
              onChanged: _searchProducts,

              decoration: InputDecoration(
                hintText: "Search fashion products...",
                prefixIcon: const Icon(Icons.search),

                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _searchProducts("");
                  },
                ),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      "No products found",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredProducts.length,

                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Image.asset(
  product["image"]!,
  width: 60,
  height: 60,
  fit: BoxFit.cover,
),
                          ),

                          title: Text(
                            product["name"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          subtitle: Text(product["category"]!),

                          trailing: Text(
                            product["price"]!,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 107, 119, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          onTap: () {
                            Navigator.pushNamed(context, "/product-details");
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
