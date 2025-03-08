import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:copartner/services/language_provider.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEnglish = Provider.of<LanguageProvider>(context).isEnglish;
    final titleText = isEnglish ? "FAQs" : "Mga Madalas Itanong";

    // -----------------------------------------------------------------------
    // ENGLISH FAQs
    // -----------------------------------------------------------------------
    final faqsEnglish = [
      // (1) Forgot password
      {
        "question": "Forgot password",
        "answer":
            "If you've forgotten your password, you can use a QR Scanner available on your mobile device and use it on your desktop to retrieve your credentials. You'll need your username and password."
      },
      // (2) Invalid verification code
      {
        "question": "Invalid verification code",
        "answer":
            "Make sure the code you entered is correct or request a new code if the old one has expired."
      },
      // (3) Exceeded the number of login attempts
      {
        "question": "Exceeded the number of login attempts",
        "answer":
            "Your account may be temporarily locked. Wait for the specified time or contact support/IT for a reset."
      },
      // (4) Username not appearing
      {
        "question": "Username not appearing",
        "answer":
            "Refresh the page or restart your device. Ensure your login credentials are correct."
      },
      // (5) Validation error
      {
        "question": "Validation error",
        "answer":
            "Make sure your information is complete and correct. If the error persists, contact support."
      },
      // (6) Cannot log in after changing password
      {
        "question": "Cannot log in after changing password",
        "answer":
            "Try clearing your browser or app's cache and cookies, and ensure your credentials are updated."
      },
      // (7) Cannot proceed with issuing benefits
      {
        "question": "Cannot proceed with issuing benefits",
        "answer":
            "You may need additional documents or verification. Check the requirements or contact the admin."
      },

      // -- Additional FAQs based on common issues from your consolidation --

      // (8) Wrong username or password (even after reset)
      {
        "question": "Why am I getting 'Wrong Username or Password'?",
        "answer":
            "Ensure you typed the correct username and password. If you recently changed your password, try logging out of other devices first or request a password reset from the IT support."
      },
      // (9) Account locked or restricted
      {
        "question": "Why is my account locked or restricted?",
        "answer":
            "This usually happens after multiple failed login attempts or if your account hasn't been fully activated. Contact your administrator or IT support to unlock or reset your account."
      },
      // (10) Firearms or items not appearing in my dashboard
      {
        "question": "Why are my firearms/items not appearing in the dashboard?",
        "answer":
            "You may not have been assigned as the correct end-user in the system. Verify your assignment with your RSPNCO/SAO or check if the item is still listed under someone else’s account."
      },
      // (11) Camera not working during issuance
      {
        "question": "Camera not working during issuance (screen blinks)",
        "answer":
            "Check your browser or app permissions for camera access. Make sure no other application is using the camera. If the problem persists, try another device or contact support."
      },
      // (12) Seeing firearms/vehicles from another unit
      {
        "question": "Why do I see firearms or vehicles from another unit?",
        "answer":
            "This may be a data mismatch or double-entry issue. Report it to your RSAO or IT support so they can correct the record and remove items that don’t belong to your account."
      },
      // (13) Turned-in firearms still in my accountability
      {
        "question": "I turned in a firearm, but it still shows under my name",
        "answer":
            "After turning in a firearm, ensure the receiving unit has completed the transfer process. If the record still appears in your PAR, request the SAO to finalize the transaction or remove it from your accountability."
      },
      // (14) Double entry or wrong serial number
      {
        "question": "How do I correct double entries or a wrong serial number?",
        "answer":
            "Submit a request for record adjustment or deletion to your RSAO/IT team. Provide details like the incorrect serial number and the correct one, so they can fix the entry in the system."
      },
    ];

    // -----------------------------------------------------------------------
    // TAGALOG FAQs
    // -----------------------------------------------------------------------
    final faqsFilipino = [
      // (1) Nakalimutan ang password
      {
        "question": "Nakalimutan ang password",
        "answer":
            "Kapag nakalimutan ang iyong password, maaaring gumamit ng QR Scanner na puwedeng makuha sa iyong mobile device, at gagamitin ito sa iyong desktop upang ma-retrieve ang iyong credentials. Kailangan ang username at password."
      },
      // (2) Di wastong code ng beripikasyon
      {
        "question": "Di wastong code ng beripikasyon",
        "answer":
            "Tiyaking tama ang code na inilagay o humiling ng bagong code kung ito ay paso na."
      },
      // (3) Lumampas sa bilang ng pagtangka sa pag log-in
      {
        "question": "Lumampas sa bilang ng pagtangka sa pag log-in",
        "answer":
            "Maaaring pansamantalang ma-lock ang iyong account. Hintayin ang itinakdang oras o makipag-ugnayan sa support/IT para i-reset ito."
      },
      // (4) Hindi lumalabas ang username
      {
        "question": "Hindi lumalabas ang username",
        "answer":
            "I-refresh ang page o i-restart ang iyong device. Siguraduhing tama ang iyong login credentials."
      },
      // (5) Error sa validation
      {
        "question": "Error sa validation",
        "answer":
            "Siguraduhing kumpleto at wasto ang iyong impormasyon. Kung patuloy ang error, kontakin ang support."
      },
      // (6) Hindi makapag-login matapos palitan ang password
      {
        "question": "Hindi makapag-login matapos palitan ang password",
        "answer":
            "Subukang i-clear ang cache at cookies ng iyong browser o app, at tiyaking na-update ang iyong credentials."
      },
      // (7) Hindi makapagpatuloy sa pag-isyu ng mga benipisyo
      {
        "question": "Hindi makapagpatuloy sa pag-isyu ng mga benipisyo",
        "answer":
            "Maaaring kailanganin ang karagdagang dokumento o verification. Pakitingnan ang mga requirements o kontakin ang admin."
      },

      // -- Additional FAQs based on your consolidation --

      // (8) Wrong username or password (kahit nag-reset na)
      {
        "question": "Bakit lumalabas na 'Wrong Username or Password'?",
        "answer":
            "Siguraduhing tama ang username at password na inilalagay. Kung nag-reset ka kamakailan, subukang mag-logout sa ibang device o mag-request ng bagong password mula sa IT support."
      },
      // (9) Account locked or restricted
      {
        "question": "Bakit naka-lock o restricted ang aking account?",
        "answer":
            "Karaniwan itong nangyayari kapag maraming beses kang nagkamali sa pag-log in o hindi pa lubusang na-activate ang account mo. Kontakin ang administrator o IT support para i-unlock o i-reset ito."
      },
      // (10) Wala akong nakikitang firearms/items sa dashboard
      {
        "question": "Bakit wala akong nakikitang firearms/items sa dashboard?",
        "answer":
            "Maaring hindi ikaw ang tamang end-user na naka-assign sa system. I-verify sa iyong RSPNCO/SAO o tingnan kung nakalagay pa ito sa account ng iba."
      },
      // (11) Hindi gumagana ang camera sa issuance (nagsi-blink lang)
      {
        "question": "Bakit hindi gumagana ang camera kapag nag-i-issue?",
        "answer":
            "Suriin ang browser o app permissions kung pinapayagan ang camera access. Siguraduhing walang ibang app na gumagamit ng camera. Kung patuloy pa rin, subukang gumamit ng ibang device o kontakin ang support."
      },
      // (12) Nakikita ko ang firearms/vehicles ng ibang unit
      {
        "question": "Bakit nakikita ko ang firearms o vehicles ng ibang unit?",
        "answer":
            "Maaaring may data mismatch o double-entry. I-report ito sa RSAO o IT support upang maitama at maalis ang mga item na hindi dapat naka-assign sa iyo."
      },
      // (13) Nag-turn in na ako ng baril, pero nasa accountability ko pa rin
      {
        "question":
            "Nag-turn in na ako ng baril, pero nasa akin pa rin ang record",
        "answer":
            "Pagkatapos mag-turn in, dapat kumpletuhin ng receiving unit ang transfer process. Kung lumalabas pa rin sa PAR mo, humiling sa SAO na tapusin ang transaction o alisin ito sa iyong accountability."
      },
      // (14) Double entry o maling serial number
      {
        "question": "Paano itama ang double entry o maling serial number?",
        "answer":
            "Mag-submit ng request para sa record adjustment o deletion sa RSAO/IT team. Ibigay ang detalye ng maling serial number at ang tama nito upang maitama nila ang entry sa system."
      },
    ];

    // Pick the appropriate list
    final faqs = isEnglish ? faqsEnglish : faqsFilipino;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
          style: const TextStyle(
            fontFamily: 'Alumni Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final item = faqs[index];
          return ExpansionTile(
            title: Text(
              item["question"] ?? "",
              style: const TextStyle(
                fontFamily: 'Alumni Sans',
                fontSize: 18,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  item["answer"] ?? "",
                  style: const TextStyle(
                    fontFamily: 'Alumni Sans',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
