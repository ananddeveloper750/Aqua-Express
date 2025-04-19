import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      "JD",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "John Doe",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("john.doe@example.com", style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Account Settings
              buildSectionTitle("ACCOUNT SETTINGS"),
              buildListTile(Icons.person, "Personal Information"),
              buildListTile(Icons.credit_card, "Payment Methods"),
              buildListTile(Icons.lock, "Privacy & Security"),

              const SizedBox(height: 10),

              // Notifications
              buildSectionTitle("NOTIFICATIONS"),
              buildToggleTile(Icons.notifications, "Push Notifications"),
              buildToggleTile(Icons.email, "Email Notifications"),

              const SizedBox(height: 10),

              // Support
              buildSectionTitle("SUPPORT"),
              buildListTile(Icons.help, "Help Center"),
              buildListTile(Icons.info, "About Us"),

              const SizedBox(height: 20),

              // Logout Button
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget buildToggleTile(IconData icon, String title) {
    return SwitchListTile(
      title: Text(title),
      secondary: Icon(icon, color: Colors.blue),
      value: false,
      onChanged: (bool value) {},
    );
  }
}
