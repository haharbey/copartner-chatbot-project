import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copartner/modules/home/home_screen.dart';
import 'package:copartner/services/language_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final isEnglish = context.watch<LanguageProvider>().isEnglish;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
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
      ),
      body: Center(
        child: Text(
          isEnglish
              ? "You have no notification yet."
              : "Wala ka pang notification.",
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Alumni Sans',
          ),
        ),
      ),
    );
  }
}
