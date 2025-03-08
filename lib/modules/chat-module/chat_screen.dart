import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copartner/services/language_provider.dart';

/// Updated English Solutions for LDIMS issues
final Map<String, String> solutionsEnglish = {
  "Wrong Username or Password":
      "Double-check your input: Username must be your PES Email, Password as set by the LDIMS user, and TOTP from Google Authenticator (LDIMS). If the error persists, you will be prompted to provide your name for a password reset. Once reset, refresh your browser, go to https://ldims.pnp.gov.ph, and log in using your PES Email, default password: \$upplyCh@!n, and TOTP.",
  "Exceeded Login Attempts / Account Locked":
      "You will be prompted to provide your name to reset your login attempts counter. Once reset, refresh your browser, go to https://ldims.pnp.gov.ph, and log in with your PES Email, Password, and TOTP.",
  "2FA or Verification Code Errors":
      "You will be prompted to remove 'LDIMS' from your Google Authenticator and provide your name to reset Two-Factor Authentication (2FA). After reset, refresh your browser, visit https://ldims.pnp.gov.ph, and log in using your PES Email, Password, and TOTP. A new QR code will be displayed – scan it with your mobile Google Authenticator, complete the login using the code, then refresh and re-login if needed.",
  "Activation/Deactivation Requests":
      "PNP units must submit a list of personnel for LDIMS account activation—including names, unit assignment, PES Email, CP number, and the previous LDIMS user's name for replacement. The requesting unit will be notified once the LDIMS PMT completes the process.",
  "Outdated/Incorrect Contact Information":
      "Due to data breach incidents in several PNP systems, LDIMS is not connected in real time to OPRMS. This may result in outdated or incorrect contact information.",
  "Firearms Still Appearing Under Old User":
      "If firearms remain under your account even after turn-in or new issuance, coordinate with the receiving unit via memo (with attachment) to process the turn-in and tag-onstock procedure.",
  "Double Issuance or Wrong Serial Number":
      "Duplicate, incorrect, or mismatched records (e.g., GALIL/Taurus serials) may appear. A final report will be forwarded to OIC, SAO WIDE for resolution.",
  "Missing Firearms Data":
      "Firearms that are not yet recorded in the LDIMS database will be encoded once the dashboard is complete.",
  "Incorrect Firearm Categorization":
      "If firearms are miscategorized (e.g., a Galil appearing as a crew-served weapon), please ensure correct data entry. All LDIMS users must be responsible for accurate record-keeping.",
  "Issuance Finalization Problems":
      "If the 'Confirm/Finalize Issuance' button blinks or shows 'Not Available', check SAO RECORDS – FIREARMS – VERIFY THROUGH LDIMS to confirm if personnel have been issued equipment. This message appears only if no equipment has been issued.",
  "Firearms Not Visible in Dashboard":
      "If firearms do not appear on your dashboard for validation, issuance, or renewal, please note that the LDIMS PMT is addressing this concern and updates will be reflected soon.",
  "Renewal Errors":
      "If, after renewal, old data or previous end-user information still appears, please contact support for further assistance.",
  "Spelling Errors in User Names":
      "Coordinate with DPRM regarding personnel information to correct any spelling errors in user names.",
  "Wrong Region/Unit Displayed":
      "Provide screenshots and relevant details to LDIMS technical support to correct mismatches in unit or region display.",
  "Cross-Unit Firearm/Vehicle Display":
      "If you see firearms or vehicles from units you are not assigned to, please share screenshots and details with LDIMS technical support for resolution.",
  "Take Photo Button Not Working":
      "If the 'Take Photo' button is not working during issuance or renewal, update your browser and verify your camera settings.",
  "Camera Access Issues":
      "If the screen blinks or no photo is displayed, coordinate with your ITPO regarding your workstation and camera equipment.",
  "Outdated Mobility Records":
      "If vehicles remain assigned even though they are no longer in your unit’s inventory, coordinate with the previous unit to process the turn-in and tag-onstock procedure.",
  "Excess or Incorrect Mobility Entries":
      "Consolidate all mobility records and submit a memo request for correction and deletion to the DL."
};

/// Updated Tagalog Solutions for LDIMS issues
final Map<String, String> solutionsTagalog = {
  "Wrong Username or Password":
      "Siguraduhin na tama ang iyong inilagay: Ang Username ay dapat ang iyong PES Email, ang Password ay itinakda ng LDIMS user, at ang TOTP ay mula sa Google Authenticator (LDIMS). Kung nagpapatuloy ang error, hihingan ka ng iyong pangalan para sa password reset. Pagkatapos ma-reset, i-refresh ang browser, puntahan ang https://ldims.pnp.gov.ph, at mag-log in gamit ang iyong PES Email, default password: \$upplyCh@!n, at TOTP.",
  "Exceeded Login Attempts / Account Locked":
      "Hihingan ka ng iyong pangalan para i-reset ang bilang ng login attempts. Pagkatapos, i-refresh ang browser, puntahan ang https://ldims.pnp.gov.ph, at mag-log in gamit ang iyong PES Email, Password, at TOTP.",
  "2FA or Verification Code Errors":
      "Hihingan ka na alisin ang 'LDIMS' sa iyong Google Authenticator at ibigay ang iyong pangalan para i-reset ang Two-Factor Authentication (2FA). Pagkatapos, i-refresh ang browser, puntahan ang https://ldims.pnp.gov.ph, at mag-log in gamit ang iyong PES Email, Password, at TOTP. Magpapakita ng bagong QR code – i-scan ito gamit ang Google Authenticator sa iyong telepono, tapos kompletuhin ang login gamit ang code. I-refresh at mag-log in muli kung kinakailangan.",
  "Activation/Deactivation Requests":
      "Dapat magsumite ang mga yunit ng PNP ng listahan ng mga personnel para sa activation ng LDIMS account, kasama ang pangalan, unit assignment, PES Email, CP no., at pangalan ng dating LDIMS user para sa replacement. Aabisuhan ang requesting unit kapag kumpleto na ang proseso ng LDIMS PMT.",
  "Outdated/Incorrect Contact Information":
      "Dahil sa mga data breach sa ilang PNP systems, hindi real-time ang koneksyon ng LDIMS sa OPRMS. Maaaring lumabas ang outdated o maling impormasyon sa contact.",
  "Firearms Still Appearing Under Old User":
      "Kung patuloy na lumalabas ang mga baril sa iyong account kahit na na-turn in o na-issue na sa iba, makipag-ugnayan sa receiving unit sa pamamagitan ng memo (may attachment) upang iproseso ang turn-in at tag-onstock procedure.",
  "Double Issuance or Wrong Serial Number":
      "Maaaring magpakita ng duplicate, maling, o hindi tugmang records (hal. GALIL/Taurus serials). Ipapasa ang final report sa OIC, SAO WIDE para sa resolusyon.",
  "Missing Firearms Data":
      "Ang mga baril na hindi pa naka-record sa LDIMS database ay i-encode kapag kumpleto na ang dashboard.",
  "Incorrect Firearm Categorization":
      "Kung mali ang pagkakakategorya ng baril (hal. ang Galil ay lumalabas bilang crew-served weapon), tiyaking tama ang pag-input ng data. Lahat ng LDIMS user ay may responsibilidad sa tamang record-keeping.",
  "Issuance Finalization Problems":
      "Kung ang 'Confirm/Finalize Issuance' button ay nagbi-blink o nagpapakita ng 'Not Available', i-check ang SAO RECORDS – FIREARMS – VERIFY THROUGH LDIMS upang malaman kung may na-issue na kagamitan ang personnel. Lumalabas ito lamang kung walang na-issue na kagamitan.",
  "Firearms Not Visible in Dashboard":
      "Kung walang baril na lumalabas sa dashboard para sa validation, issuance, o renewal, abisuhan ang LDIMS PMT; ina-update na nila ito.",
  "Renewal Errors":
      "Kung pagkatapos ng renewal ay lumalabas pa rin ang lumang data o end-user, makipag-ugnayan sa support para sa karagdagang tulong.",
  "Spelling Errors in User Names":
      "Makipag-ugnayan sa DPRM tungkol sa impormasyon ng personnel upang itama ang maling spelling ng pangalan.",
  "Wrong Region/Unit Displayed":
      "Magbigay ng screenshot at mga detalye sa LDIMS technical support upang maitama ang maling unit o rehiyon.",
  "Cross-Unit Firearm/Vehicle Display":
      "Kung nakikita mo ang mga baril o sasakyan mula sa ibang yunit na hindi dapat sa iyo, ipadala ang screenshot at impormasyon sa LDIMS technical support para maayos.",
  "Take Photo Button Not Working":
      "Kung hindi gumagana ang 'Take Photo' button sa issuance o renewal, i-update ang browser at suriin ang camera settings.",
  "Camera Access Issues":
      "Kung nagbi-blink ang screen o walang lumalabas na larawan, makipag-ugnayan sa ITPO tungkol sa iyong workstation at kagamitan sa camera.",
  "Outdated Mobility Records":
      "Kung may mga sasakyang nakatalaga pa kahit wala na sa inventory ng iyong yunit, makipag-ugnayan sa dating yunit upang iproseso ang turn-in at tag-onstock procedure.",
  "Excess or Incorrect Mobility Entries":
      "Pag-isahin ang lahat ng mobility records at magsumite ng memo request para sa correction at deletion sa DL."
};

/// Consolidated categories for the user to pick from
final Map<String, List<String>> faqCategories = {
  "Login & Account Issues": [
    "Wrong Username or Password",
    "Exceeded Login Attempts / Account Locked",
    "2FA or Verification Code Errors",
    "Activation/Deactivation Requests",
    "Outdated/Incorrect Contact Information"
  ],
  "Firearm Assignment & Record Discrepancies": [
    "Firearms Still Appearing Under Old User",
    "Double Issuance or Wrong Serial Number",
    "Missing Firearms Data",
    "Incorrect Firearm Categorization"
  ],
  "System Navigation & Validation Problems": [
    "Issuance Finalization Problems",
    "Firearms Not Visible in Dashboard",
    "Renewal Errors"
  ],
  "Name, Unit, or Role Mismatches": [
    "Spelling Errors in User Names",
    "Wrong Region/Unit Displayed",
    "Cross-Unit Firearm/Vehicle Display"
  ],
  "Camera / Photo Capture Failures": [
    "Take Photo Button Not Working",
    "Camera Access Issues"
  ],
  "Mobility Records Errors": [
    "Outdated Mobility Records",
    "Excess or Incorrect Mobility Entries"
  ]
};

Map<String, String> getSolutions(BuildContext context) {
  final isEnglish =
      Provider.of<LanguageProvider>(context, listen: false).isEnglish;
  return isEnglish ? solutionsEnglish : solutionsTagalog;
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? selectedCategory;
  String? selectedIssue;
  List<String> currentOptions = [];

  @override
  void initState() {
    super.initState();
    _startConversation();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Helper: Format timestamp as HH:MM
  String _formatTimestamp(DateTime timestamp) {
    return "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}";
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// Start conversation with greeting, then show categories
  void _startConversation() {
    final isEnglish = context.read<LanguageProvider>().isEnglish;
    final greetingText = isEnglish
        ? "Hello! I'm CoPartner, your virtual assistant. How can I help you today? 😊"
        : "Magandang araw! Ako si CoPartner, ang iyong virtual assistant. Paano kita matutulungan ngayon? 😊";
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _messages.add({
          'sender': 'COPARTNER',
          'message': greetingText,
          'time': DateTime.now(),
          'showTime': false,
        });
      });
      _scrollToBottom();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        _showCategories();
      });
    });
  }

  /// Display FAQ categories
  void _showCategories() {
    final isEnglish = context.read<LanguageProvider>().isEnglish;
    final categoryPrompt = isEnglish
        ? "Please select a category below:"
        : "Pumili ng kategorya sa ibaba:";
    if (!mounted) return;
    setState(() {
      selectedCategory = null;
      selectedIssue = null;
      currentOptions = [];
      _messages.add({
        'sender': 'COPARTNER',
        'message': categoryPrompt,
        'options': faqCategories.keys.toList(),
        'type': 'category',
        'active': true,
        'time': DateTime.now(),
        'showTime': false,
      });
    });
    _scrollToBottom();
  }

  /// Handle category selection
  void _handleCategorySelection(String category) {
    for (int i = _messages.length - 1; i >= 0; i--) {
      var msg = _messages[i];
      if (msg['type'] == 'category' && msg['active'] == true) {
        msg['active'] = false;
        msg['selectedOption'] = category;
        break;
      }
    }
    setState(() {
      selectedCategory = category;
      selectedIssue = null;
      currentOptions = faqCategories[category] ?? [];
      _messages.add({
        'sender': 'User',
        'message': category,
        'time': DateTime.now(),
        'showTime': false,
      });
    });
    _scrollToBottom();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      final isEnglish = context.read<LanguageProvider>().isEnglish;
      final issuePrompt =
          isEnglish ? "Please select an issue:" : "Pumili ng isyu:";
      setState(() {
        _messages.add({
          'sender': 'COPARTNER',
          'message': issuePrompt,
          'options': currentOptions,
          'type': 'subCategory',
          'active': true,
          'time': DateTime.now(),
          'showTime': false,
        });
      });
      _scrollToBottom();
    });
  }

  /// Handle issue selection
  void _handleIssueSelection(String issue) {
    for (int i = _messages.length - 1; i >= 0; i--) {
      var msg = _messages[i];
      if (msg['type'] == 'subCategory' && msg['active'] == true) {
        msg['active'] = false;
        msg['selectedOption'] = issue;
        break;
      }
    }
    setState(() {
      selectedIssue = issue;
      _messages.add({
        'sender': 'User',
        'message': issue,
        'time': DateTime.now(),
        'showTime': false,
      });
    });
    _scrollToBottom();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      final solutions = getSolutions(context);
      setState(() {
        _messages.add({
          'sender': 'COPARTNER',
          'message': solutions[issue] ??
              (context.read<LanguageProvider>().isEnglish
                  ? "Solution not found. Please contact support."
                  : "Walang nakitang solusyon. Makipag-ugnayan sa support."),
          'time': DateTime.now(),
          'showTime': false,
        });
      });
      _scrollToBottom();
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        final isEnglish = context.read<LanguageProvider>().isEnglish;
        final helpfulPrompt = isEnglish
            ? "Was this solution helpful?"
            : "Nakatulong ba ang solusyon na ito?";
        setState(() {
          _messages.add({
            'sender': 'COPARTNER',
            'message': helpfulPrompt,
            'options': ["Yes ✅", "No ❌"],
            'type': 'feedback',
            'active': true,
            'time': DateTime.now(),
            'showTime': false,
          });
        });
        _scrollToBottom();
      });
    });
  }

  /// Handle feedback selection
  void _handleFeedback(String feedback) {
    for (int i = _messages.length - 1; i >= 0; i--) {
      var msg = _messages[i];
      if (msg['type'] == 'feedback' && msg['active'] == true) {
        msg['active'] = false;
        msg['selectedOption'] = feedback;
        break;
      }
    }
    setState(() {
      _messages.add({
        'sender': 'User',
        'message': feedback,
        'time': DateTime.now(),
        'showTime': false,
      });
    });
    _scrollToBottom();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      final isEnglish = context.read<LanguageProvider>().isEnglish;
      final successText = isEnglish
          ? "Glad we could help! Returning to main menu."
          : "Ikinagagalak naming makatulong! Babalik tayo sa main menu.";
      final contactSupportText = isEnglish
          ? "Please contact support for further assistance."
          : "Mangyaring makipag-ugnayan sa support para sa karagdagang tulong.";
      setState(() {
        if (feedback == "Yes ✅") {
          _messages.add({
            'sender': 'COPARTNER',
            'message': successText,
            'time': DateTime.now(),
            'showTime': false,
          });
          Future.delayed(const Duration(seconds: 2), () {
            if (!mounted) return;
            _showCategories();
          });
        } else {
          _messages.add({
            'sender': 'COPARTNER',
            'message': contactSupportText,
            'time': DateTime.now(),
            'showTime': false,
          });
        }
      });
      _scrollToBottom();
    });
  }

  /// Simple rule-based approach for free-text queries
  String _getAnswer(String userMessage) {
    final solutions = getSolutions(context);
    final lowerMessage = userMessage.toLowerCase();
    String bestKey = "";
    int bestScore = 0;

    for (final key in solutions.keys) {
      int score = 0;
      final words = key.toLowerCase().split(" ");
      for (final word in words) {
        if (lowerMessage.contains(word)) {
          score++;
        }
      }
      if (score > bestScore) {
        bestScore = score;
        bestKey = key;
      }
    }
    if (bestScore > 0) {
      return solutions[bestKey]!;
    } else {
      return context.read<LanguageProvider>().isEnglish
          ? "I'm sorry, I don't have an answer for that."
          : "Pasensya na, wala akong sagot para diyan.";
    }
  }

  /// Sending free-text messages
  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': 'User',
          'message': text,
          'time': DateTime.now(),
          'showTime': false,
        });
        _textController.clear();
      });
      _scrollToBottom();

      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        final answer = _getAnswer(text);
        setState(() {
          _messages.add({
            'sender': 'COPARTNER',
            'message': answer,
            'time': DateTime.now(),
            'showTime': false,
          });
        });
        _scrollToBottom();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userBubbleColor = const Color(0xFFCCF3FC);
    final botBubbleColor = const Color(0xFFF6F6F6);

    return Scaffold(
      // No AppBar or BottomNavigationBar here to avoid duplicates.
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 18,
            color: Colors.black,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      final isUser = message['sender'] == 'User';
                      bool showTime = message['showTime'] ?? false;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            message['showTime'] =
                                !(message['showTime'] ?? false);
                          });
                        },
                        child: isUser
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: userBubbleColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Text(
                                      message['message']!,
                                      style: const TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  if (showTime)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 4.0, top: 2.0),
                                      child: Text(
                                        _formatTimestamp(message['time']),
                                        style: const TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  if (message.containsKey('options'))
                                    _buildOptionsWidget(message),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    backgroundImage: const AssetImage(
                                      'assets/images/copartner-noname.png',
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: botBubbleColor,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Text(
                                            message['message']!,
                                            style: const TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        if (showTime)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4.0,
                                              top: 2.0,
                                            ),
                                            child: Text(
                                              _formatTimestamp(message['time']),
                                              style: const TextStyle(
                                                fontFamily: "Roboto",
                                                fontSize: 12,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        if (message.containsKey('options'))
                                          _buildOptionsWidget(message),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textController,
                  style: const TextStyle(fontFamily: "Roboto"),
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    hintStyle: const TextStyle(fontFamily: "Roboto"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2F3296),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: _sendMessage,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the options widget for messages that contain selectable options.
  Widget _buildOptionsWidget(Map<String, dynamic> message) {
    Widget optionsWidget;
    final bool isActive = message['active'] == true;
    final List<String> options = (message['options'] as List).cast<String>();
    final selectedOption = message['selectedOption'] ?? "";
    final messageType = message['type'];

    if (messageType == 'category' || messageType == 'subCategory') {
      if (isActive) {
        optionsWidget = Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: options.map((option) {
            return OutlinedButton(
              onPressed: () {
                if (messageType == 'category') {
                  _handleCategorySelection(option);
                } else {
                  _handleIssueSelection(option);
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade800),
              ),
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        );
      } else {
        // Already selected; show the chosen one as highlighted
        optionsWidget = Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: options.map((option) {
            if (option == selectedOption) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F3296),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else {
              return OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                  ),
                ),
              );
            }
          }).toList(),
        );
      }
    } else if (messageType == 'feedback') {
      if (isActive) {
        optionsWidget = Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: options.map((option) {
            return OutlinedButton(
              onPressed: () {
                _handleFeedback(option);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade800),
              ),
              child: Text(
                option,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        );
      } else {
        // Already responded with Yes or No
        optionsWidget = Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: options.map((option) {
            if (option == selectedOption) {
              return ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else {
              return OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade800),
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                  ),
                ),
              );
            }
          }).toList(),
        );
      }
    } else {
      // If there's a different type of options in the future
      optionsWidget = Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: options.map((option) {
          return ElevatedButton(
            onPressed: () {
              _handleFeedback(option);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              side: BorderSide(color: Colors.grey.shade800),
            ),
            child: Text(
              option,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: "Roboto", fontSize: 15),
            ),
          );
        }).toList(),
      );
    }
    return optionsWidget;
  }
}
