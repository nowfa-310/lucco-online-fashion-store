import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
  {
    "name": "Luxury Dress",
    "price": 5990.00,
    "qty": 1,
    "image": "assets/images/products/luxury_dress.jpg",
  },
  {
    "name": "Leather Jacket",
    "price": 12990.00,
    "qty": 2,
    "image": "assets/images/products/leather_jacket.jpg",
  },
];

  final TextEditingController couponController = TextEditingController();

  double get subtotal {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"] * item["qty"];
    }
    return total;
  }

  final double delivery = 350.0;

  @override
  Widget build(BuildContext context) {
    final double grandTotal = subtotal + delivery;

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart"), centerTitle: true),
      body: cartItems.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text("Your Cart is Empty", style: TextStyle(fontSize: 22)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item["image"],
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                      "Rs. ${item["price"].toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(245, 107, 119, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (item["qty"] > 1) {
                                                item["qty"]--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove_circle),
                                        ),

                                        Text(
                                          "${item["qty"]}",
                                          style: const TextStyle(fontSize: 18),
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              item["qty"]++;
                                            });
                                          },
                                          icon: const Icon(Icons.add_circle),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    cartItems.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.black12),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: couponController,
                        decoration: InputDecoration(
                          hintText: "Coupon Code",
                          prefixIcon: const Icon(Icons.discount_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Subtotal"),
                          Text(
                            "Rs. ${subtotal.toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Delivery"),
                          Text("Rs. ${delivery.toStringAsFixed(2)}"),
                        ],
                      ),

                      const Divider(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Grand Total",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Rs. ${grandTotal.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color.fromRGBO(245, 107, 119, 1),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(245, 107, 119, 1),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/checkout");
                          },
                          child: const Text(
                            "Proceed to Checkout",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
