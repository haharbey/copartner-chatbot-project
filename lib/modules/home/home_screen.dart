import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copartner/modules/chat-module/chat_screen.dart';
import 'package:copartner/modules/profile/profile_screen.dart';
import 'package:copartner/modules/notification/notification_screen.dart';
import 'package:copartner/modules/settings/settings_screen.dart';
import 'package:copartner/services/language_provider.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  final List<Widget> _pages = <Widget>[
    const HomeContent(),
    const ChatScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Conditionally build the AppBar based on _selectedIndex
  AppBar _buildAppBar(BuildContext context) {
    // If on the Chat tab (_selectedIndex == 1):
    if (_selectedIndex == 1) {
      return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Return to Home tab
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
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
        // No notification or settings icons in Chat
        actions: const [],
      );
    } else {
      // For all other tabs, show the normal AppBar with notification & settings
      return AppBar(
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
          // Notification button
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
          // Settings button
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.watch<LanguageProvider>().isEnglish;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _pages[_selectedIndex],
      // Hide the BottomNavigationBar if we're on the Chat tab
      bottomNavigationBar: _selectedIndex == 1
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: isEnglish ? "Home" : "Home",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.chat),
                  ),
                  label: isEnglish ? "Chat" : "Chat",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: isEnglish ? "Profile" : "Profile",
                ),
              ],
            ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.watch<LanguageProvider>().isEnglish;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/welcome.gif',
            width: 350,
            height: 350,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isEnglish ? "👋 Hello, " : "👋 Kumusta, ",
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Juan Dela Cruz",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Text(
            isEnglish ? "How can I help you?" : "Paano kita matutulungan?",
            style: const TextStyle(
              fontSize: 23,
              fontFamily: 'Alumni Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            isEnglish
                ? "Start chatting with CoPartner!"
                : "Simulan na ang usapan kay CoPartner!",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Alumni Sans',
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
