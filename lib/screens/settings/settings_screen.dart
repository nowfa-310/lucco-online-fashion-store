import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;
  bool biometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), centerTitle: true),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          const ListTile(
            title: Text(
              "General",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(245, 107, 119, 1),
              ),
            ),
          ),

          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text("Push Notifications"),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text("Dark Mode"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.fingerprint),
            title: const Text("Biometric Login"),
            value: biometric,
            onChanged: (value) {
              setState(() {
                biometric = value;
              });
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            subtitle: const Text("English"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("Manage Addresses"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, "/addresses");
            },
          ),

          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, "/forgot-password");
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About LUCCO"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Help & Support"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
