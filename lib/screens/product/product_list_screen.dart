import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Women",
    "Men",
    "Shoes",
    "Bags",
    "Beauty",
  ];

  final List<Map<String, dynamic>> products = [
  {
    "name": "Luxury Dress",
    "category": "Women",
    "price": 24990,
    "oldPrice": 29990,
    "rating": 4.8,
    "favorite": false,
    "image": "assets/images/products/luxury_dress.jpg",
  },
  {
    "name": "Leather Jacket",
    "category": "Men",
    "price": 18990,
    "oldPrice": 22990,
    "rating": 4.7,
    "favorite": true,
    "image": "assets/images/products/leather_jacket.jpg",
  },
  {
    "name": "Running Shoes",
    "category": "Shoes",
    "price": 15990,
    "oldPrice": 19990,
    "rating": 4.9,
    "favorite": false,
    "image": "assets/images/products/running_shoes.jpg",
  },
  {
    "name": "Luxury Handbag",
    "category": "Bags",
    "price": 21990,
    "oldPrice": 26990,
    "rating": 4.6,
    "favorite": false,
    "image": "assets/images/products/luxury_handbag.jpg",
  },
  {
    "name": "Beauty Kit",
    "category": "Beauty",
    "price": 6990,
    "oldPrice": 8990,
    "rating": 4.5,
    "favorite": false,
    "image": "assets/images/products/beauty_kit.jpg",
  },
];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory == "All"
        ? products
        : products.where((p) => p["category"] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Categories
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final selected = category == selectedCategory;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selected,
                    selectedColor: const Color.fromRGBO(245, 107, 119, 1),
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/product-details");
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(18),
                                ),
                                child: Image.network(
                                  product["image"],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: Icon(
                                      product["favorite"]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        product["favorite"] =
                                            !product["favorite"];
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["name"],
                                maxLines: 2,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  Text(product["rating"].toString()),
                                ],
                              ),

                              const SizedBox(height: 8),

                              Row(
  children: [
    Text(
      "LKR ${product["price"]}",
      style: const TextStyle(
        color: Color.fromRGBO(245, 107, 119, 1),
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
    const SizedBox(width: 8),
    Text(
      "LKR ${product["oldPrice"]}",
      style: const TextStyle(
        decoration: TextDecoration.lineThrough,
        color: Colors.grey,
      ),
    ),
  ],
),

                              const SizedBox(height: 10),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(245, 107, 119, 1),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "${product["name"]} added to cart",
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    size: 18,
                                  ),
                                  label: const Text("Add"),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
