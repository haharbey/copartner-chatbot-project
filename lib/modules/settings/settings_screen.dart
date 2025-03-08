import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copartner/modules/home/home_screen.dart';
import 'package:copartner/modules/language_settings/language_settings_screen.dart';
import 'package:copartner/modules/notification/notification_screen.dart';
import 'package:copartner/modules/appearance/appearance_settings_screen.dart';
import 'package:copartner/modules/faqs/faq_screen.dart'; // <-- Import the FAQ screen
import 'package:copartner/services/language_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 0;
  bool _notificationsSwitch = false;

  void _onItemTapped(int index) {
    if (index == 0 || index == 1 || index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(initialIndex: index),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnglish = Provider.of<LanguageProvider>(context).isEnglish;

    // Localized texts for settings
    final settingsTitle = isEnglish ? "Settings" : "Mga Setting";
    final notificationText = isEnglish ? "Notification" : "Notipikasyon";
    final languageText = isEnglish ? "Language" : "Wika";
    final appearanceText = isEnglish ? "Appearance" : "Hitsura";
    final aboutText = isEnglish ? "About Us" : "Tungkol Sa Amin";
    final faqsText = isEnglish ? "FAQs" : "Mga Madalas Itanong";
    final logoutText = isEnglish ? "Logout" : "Mag-logout";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "CO",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              TextSpan(
                text: "PARTNER",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: handle settings tap if needed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // "Settings" title
            Row(
              children: [
                Text(
                  settingsTitle,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alumni Sans',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 1. NOTIFICATION with an on/off switch
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                notificationText,
                style: const TextStyle(fontFamily: 'Alumni Sans', fontSize: 20),
              ),
              trailing: Switch(
                value: _notificationsSwitch,
                onChanged: (bool newValue) {
                  setState(() {
                    _notificationsSwitch = newValue;
                  });
                },
              ),
            ),

            // 2. LANGUAGE (Wika) - Navigate to LanguageSettingsScreen
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                languageText,
                style: const TextStyle(fontFamily: 'Alumni Sans', fontSize: 20),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageSettingsScreen(),
                  ),
                );
              },
            ),

            // 3. APPEARANCE (Hitsura) - Navigate to AppearanceSettingsScreen
            ListTile(
              leading: const Icon(Icons.brush),
              title: Text(
                appearanceText,
                style: const TextStyle(fontFamily: 'Alumni Sans', fontSize: 20),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppearanceSettingsScreen(),
                  ),
                );
              },
            ),

            // 4. ABOUT US (Tungkol Sa Amin)
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                aboutText,
                style: const TextStyle(fontFamily: 'Alumni Sans', fontSize: 20),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Implement about navigation
              },
            ),

            // 5. FAQs (Mga Madalas Itanong)
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(
                faqsText,
                style: const TextStyle(fontFamily: 'Alumni Sans', fontSize: 20),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FAQScreen(),
                  ),
                );
              },
            ),
            const Spacer(),
            // Logout button with full width
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle logout action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD62229),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                child: Text(
                  logoutText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Alumni Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.chat),
            ),
            label: "Chat",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
