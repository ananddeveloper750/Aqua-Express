import 'package:aqua_express_cloth/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:aqua_express_cloth/UserProfileScreen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Social Media Icons
import 'package:url_launcher/url_launcher.dart'; // For opening URLs

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          /// 🏷️ Centered User Info
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                SizedBox(height: 10),
                Text(
                  "Sam Bahadur",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "sambahadur@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          /// 🏠 Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(icon: Icons.person, text: "My Profile", onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                }),
                _buildDrawerItem(icon: Icons.shopping_cart, text: "My Orders", onTap: () {
                  Navigator.pushNamed(context, '/orders');
                }),
                _buildDrawerItem(icon: Icons.schedule, text: "Pending Orders", onTap: () {
                  Navigator.pushNamed(context, '/pending_orders');
                }),
                _buildDrawerItem(icon: Icons.support_agent, text: "Support", onTap: () {
                  Navigator.pushNamed(context, '/support');
                }),
                _buildDrawerItem(icon: Icons.star, text: "Rate Us", onTap: () {
                  Navigator.pushNamed(context, '/rate_us');
                }),
                _buildDrawerItem(icon: Icons.notifications, text: "Notifications", onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                }),
                _buildDrawerItem(icon: Icons.settings, text: "Settings", onTap: () {
                  Navigator.pushNamed(context, '/settings');
                }),
                _buildDrawerItem(icon: Icons.article, text: "Terms & Conditions", onTap: () {
                  Navigator.pushNamed(context, '/terms_conditions');
                }),
                _buildDrawerItem(icon: Icons.lock, text: "Change Password", onTap: () {
                  Navigator.pushNamed(context, '/change_password');
                }),
              ],
            ),
          ),

          /// 🌍 Social Media Icons
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Divider(),
                Text("Follow Us", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon("Facebook", FontAwesomeIcons.facebook, Colors.blue, "https://www.facebook.com/"),
                    SizedBox(width: 15),
                    _buildSocialIcon("Instagram", FontAwesomeIcons.instagram, Colors.pink, "https://www.instagram.com"),
                    SizedBox(width: 15),
                    _buildSocialIcon("Twitter", FontAwesomeIcons.twitter, Colors.lightBlue, "https://www.twitter.com"),
                    SizedBox(width: 15),
                    _buildSocialIcon("LinkedIn", FontAwesomeIcons.linkedin, Colors.blueAccent, "https://www.linkedin.com"),
                  ],
                ),
              ],
            ),
          ),

          /// 🔴 Logout Button
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged Out Successfully!")));
            },
          ),

          /// 📝 Copyright Text
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              "© 2025 Aqua Express. All Rights Reserved.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  /// 🎨 Custom Drawer Item Builder
  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  /// 🌍 Custom Social Media Icon Builder (Now Clickable)
  Widget _buildSocialIcon(String name, IconData icon, Color color, String url) {
    return Column(
      children: [
        // Text(name, style: TextStyle(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            Uri uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: CircleAvatar(
            radius: 23,
            backgroundColor: color.withAlpha(50),
            child: Icon(icon, size: 35, color: color),
          ),
        ),
      ],
    );
  }
}
