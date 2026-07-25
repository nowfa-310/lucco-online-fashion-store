import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      String message = "Login failed";

      switch (e.code) {
        case "user-not-found":
          message = "No user found for this email.";
          break;
        case "wrong-password":
          message = "Incorrect password.";
          break;
        case "invalid-email":
          message = "Invalid email address.";
          break;
        case "invalid-credential":
          message = "Invalid email or password.";
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                const SizedBox(height: 50),

                Container(
  width: 130,
  height: 130,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Image.asset(
      "assets/images/logo.png",
      fit: BoxFit.contain,
    ),
  ),
),

                const SizedBox(height: 25),

                const SizedBox(height: 25),

const Text(
  "Welcome Back",
  style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 8),

const Text(
  "Sign in to continue shopping with LUCCO",
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 16,
    color: Colors.grey,
  ),
),

                const SizedBox(height: 8),

                const Text(
                  "Login to your LUCCO account",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 35),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                              !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    if (value.length < 6) {
                      return "Minimum 6 characters";
                    }
                    return null;
                  },
                ),

                Row(
                  children: [

                    Checkbox(
                      value: _rememberMe,
                      activeColor: const Color.fromRGBO(245, 107, 119, 1),
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),

                    const Text("Remember Me"),

                    const Spacer(),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/forgot-password",
                        );
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(245, 107, 119, 1),
                      foregroundColor: Colors.white,
                    ),
                    onPressed:
                        _isLoading ? null : _login,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 25),

                OutlinedButton.icon(
                  onPressed: () {
                    // Google Sign-In
                  },
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text("Continue with Google"),
                  style: OutlinedButton.styleFrom(
                    minimumSize:
                        const Size(double.infinity, 55),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    const Text(
                      "Don't have an account?",
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/register",
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}