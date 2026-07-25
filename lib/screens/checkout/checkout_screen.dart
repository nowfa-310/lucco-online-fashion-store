import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String paymentMethod = "Cash on Delivery";
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }

  Future<void> placeOrder() async {
    if (!_formKey.currentState!.validate()) return;

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please login first."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Replace these with your Cart data
      List<Map<String, dynamic>> cartItems = [];

      double totalAmount = 0;

      await FirebaseFirestore.instance.collection("orders").add({
        "userId": user.uid,
        "name": nameController.text.trim(),
        "phone": phoneController.text.trim(),
        "address": addressController.text.trim(),
        "city": cityController.text.trim(),
        "paymentMethod": paymentMethod,
        "cartItems": cartItems,
        "total": totalAmount,
        "status": "Pending",
        "createdAt": FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      nameController.clear();
      phoneController.clear();
      addressController.clear();
      cityController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order placed successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacementNamed(context, "/order-success");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error : $e"),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget paymentTile(String title) {
    return RadioListTile<String>(
      value: title,
      groupValue: paymentMethod,
      title: Text(title),
      onChanged: (value) {
        setState(() {
          paymentMethod = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            const Text(
              "Shipping Address",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            buildTextField(
              controller: nameController,
              label: "Full Name",
            ),

            buildTextField(
              controller: phoneController,
              label: "Phone Number",
              keyboardType: TextInputType.phone,
            ),

            buildTextField(
              controller: addressController,
              label: "Address",
              maxLines: 3,
            ),

            buildTextField(
              controller: cityController,
              label: "City",
            ),

            const SizedBox(height: 30),

            const Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            paymentTile("Cash on Delivery"),
            paymentTile("Credit Card"),
            paymentTile("Debit Card"),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : placeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(245, 107, 119, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Place Order",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}