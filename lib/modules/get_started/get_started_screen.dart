import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copartner/services/language_provider.dart';
import 'package:copartner/modules/login/login_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build the slides here to safely use Provider.
    final List<Widget> pages = [
      _buildIntroSlide(),
      _buildLanguageSlide(),
      _buildFinalSlide(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: pages,
            ),
          ),
          // Dot indicator at the bottom.
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Slide 1: Intro Slide.
  Widget _buildIntroSlide() {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool useEnglish = languageProvider.isEnglish;

    final title = useEnglish
        ? "Welcome"
        : "Maligayang Pagdating";
    final description = useEnglish
        ? "Your reliable companion for answering all of your concerns. Let's get you started!"
        : "Ang iyong mapagkakatiwalaang kasama para sagutin ang lahat ng iyong mga alalahanin. Simulan na natin!";

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/copartner-slide1-img.png',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alumni Sans",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontFamily: "Alumni Sans",
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Slide 2: Language Selection.
  Widget _buildLanguageSlide() {
    final languageProvider = Provider.of<LanguageProvider>(context);
    // Use both isEnglish and hasSelectedLanguage to decide styling.
    final bool hasSelected = languageProvider.hasSelectedLanguage;
    // For translating texts on this slide, default to English if not selected.
    final bool useEnglishForText = hasSelected ? languageProvider.isEnglish : true;

    final title = useEnglishForText
        ? "Select Your Language"
        : "Piliin ang Iyong Wika";
    final description = useEnglishForText
        ? "Choose your language below."
        : "Piliin ang iyong wika sa ibaba.";

    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 45),
                  Image.asset(
                    'assets/images/copartner-slide3-img.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Alumni Sans",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontFamily: "Alumni Sans",
                    ),
                  ),
                  const SizedBox(height: 30),
                  // English Box
                  GestureDetector(
                    onTap: () {
                      languageProvider.setLanguage("English");
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // Highlight only if a language has been selected and it is English.
                        color: (hasSelected && languageProvider.isEnglish)
                            ? Colors.grey.shade200
                            : Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: (hasSelected && languageProvider.isEnglish)
                              ? Colors.black
                              : Colors.grey.shade300,
                          width: 3.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '👋 Hello!',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Alumni Sans",
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'How are you?',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Alumni Sans",
                                ),
                              ),
                            ],
                          ),
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: Text(
                              'English',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Alumni Sans",
                              ),
                            ),
                          ),
                          if (hasSelected && languageProvider.isEnglish)
                            const Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(Icons.check_circle, color: Colors.green, size: 24),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Tagalog Box
                  GestureDetector(
                    onTap: () {
                      languageProvider.setLanguage("Tagalog");
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // Highlight only if a language has been selected
                        color: (hasSelected && !languageProvider.isEnglish)
                            ? Colors.grey.shade200
                            : Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: (hasSelected && !languageProvider.isEnglish)
                              ? Colors.black
                              : Colors.grey.shade300,
                          width: 3.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '👋 Mabuhay!',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Alumni Sans",
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Kamusta ka?',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Alumni Sans",
                                ),
                              ),
                            ],
                          ),
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: Text(
                              'Tagalog',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Alumni Sans",
                              ),
                            ),
                          ),
                          if (hasSelected && !languageProvider.isEnglish)
                            const Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(Icons.check_circle, color: Colors.green, size: 24),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Slide 3: Final Slide.
  Widget _buildFinalSlide() {
    final languageProvider = Provider.of<LanguageProvider>(context);
    // Default to English text if the user hasn't explicitly chosen one.
    final bool useEnglish = languageProvider.hasSelectedLanguage
        ? languageProvider.isEnglish
        : true;

    final title = useEnglish ? "Got a Question?" : "May Tanong Ka Ba?";
    final description = useEnglish
        ? "Start chatting now to get instant answers to your FAQs and concerns."
        : "Simulan ang pag-uusap ngayon para makakuha ng agarang sagot sa iyong mga katanungan at problema.";

    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/copartner-slide2-img.png',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alumni Sans",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontFamily: "Alumni Sans",
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F3296),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      useEnglish ? "GET STARTED" : "MAGSIMULA NA",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Alumni Sans",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
