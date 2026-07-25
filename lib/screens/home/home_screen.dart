import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"name": "Women", "icon": Icons.checkroom},
    {"name": "Men", "icon": Icons.man},
    {"name": "Shoes", "icon": Icons.hiking},
    {"name": "Bags", "icon": Icons.shopping_bag},
    {"name": "Beauty", "icon": Icons.face},
  ];

  final List<Map<String, String>> products = [
    {
      "name": "Luxury Dress",
      "price": "LKR 5,990",
      "image": "assets/images/products/luxury_dress.jpg",
    },
    {
      "name": "Leather Jacket",
      "price": "LKR 12,990",
      "image": "assets/images/products/leather_jacket.jpg",
    },
    {
      "name": "Classic Shoes",
      "price": "LKR 8,990",
      "image": "assets/images/products/classic_shoes.jpg",
    },
    {
      "name": "Luxury Handbag",
      "price": "LKR 9,990",
      "image": "assets/images/products/luxury_handbag.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 40, width: 40),
            const SizedBox(width: 10),
            const Text(
              "LUCCO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, "/wishlist");
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            color: Colors.black,
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("No notifications")));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Search
              TextField(
                readOnly: true,
                onTap: () {
                  Navigator.pushNamed(context, "/search");
                },
                decoration: InputDecoration(
                  hintText: "Search fashion...",
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

              /// Banner
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200",
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/categories");
                      },
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: const Color.fromRGBO(
                                245,
                                107,
                                119,
                                1,
                              ),
                              child: Icon(
                                categories[index]["icon"],
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              categories[index]["name"],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: const Color.fromRGBO(
                              245,
                              107,
                              119,
                              1,
                            ),
                            child: Icon(
                              categories[index]["icon"],
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index]["name"],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Featured Products",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/product-details");
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  product["image"]!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              product["name"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              product["price"]!,
                              style: const TextStyle(
                                color: Color.fromRGBO(245, 107, 119, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/wishlist");
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_shopping_cart),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/cart");
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(245, 107, 119, 1),
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              // Home
              break;

            case 1:
              Navigator.pushNamed(context, "/categories");
              break;

            case 2:
              Navigator.pushNamed(context, "/cart");
              break;

            case 3:
              Navigator.pushNamed(context, "/wishlist");
              break;

            case 4:
              Navigator.pushNamed(context, "/profile");
              break;
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
