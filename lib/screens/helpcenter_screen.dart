import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F1E7),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2A44),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Help Center",
          style: GoogleFonts.getFont(
            'Abril Fatface',
            color: Colors.white,
            fontSize: 26,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- TITLE ----------------
            Text(
              "How can we help you?",
              style: GoogleFonts.getFont(
                'Abril Fatface',
                fontSize: 28,
                color: const Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 20),

            // ---------------- FAQ SECTION ----------------
            _faqSection(),

            const SizedBox(height: 35),

            // ---------------- CONTACT SUPPORT ----------------
            Text(
              "Contact Support",
              style: GoogleFonts.getFont(
                'Abril Fatface',
                fontSize: 26,
                color: const Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 15),

            _contactTile(
              icon: Icons.chat_bubble_outline,
              title: "Chat with Support",
              onTap: () {},
            ),
            _contactTile(
              icon: Icons.email_outlined,
              title: "Email Us",
              subtitle: "support@hunar.com",
              onTap: () {},
            ),
            _contactTile(
              icon: Icons.call_outlined,
              title: "Call Support",
              subtitle: "+92 300 1234567",
              onTap: () {},
            ),

            const SizedBox(height: 30),

            Center(
              child: Text(
                "We’re here to help you 24/7",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- FAQ SECTION WIDGET ----------------
  Widget _faqSection() {
    return Column(
      children: [
        _faqItem(
          question: "How do I reset my password?",
          answer:
              "Go to the Profile section → Settings → Change Password. Enter your old password and create a new one.",
        ),
        _faqItem(
          question: "How do I update my profile information?",
          answer:
              "Open the Profile tab and tap on the edit button. You can update your name, phone, email, and other details.",
        ),
        _faqItem(
          question: "Why is my discount not applying?",
          answer:
              "Make sure the discount is still active and you meet the required eligibility. If the issue continues, contact support.",
        ),
        _faqItem(
          question: "How do I check my order or booking history?",
          answer:
              "Go to the 'Transaction History' page from your profile. You can view all your past orders and details.",
        ),
        _faqItem(
          question: "Can I change my payment method?",
          answer:
              "Yes. Visit the Payment Methods section under Profile and add/remove your payment options.",
        ),
        _faqItem(
          question: "How do I report a problem?",
          answer:
              "Scroll down to 'Contact Support' and choose Chat, Email, or Call to report any issue you're facing.",
        ),
        _faqItem(
          question: "Why am I not receiving verification emails?",
          answer:
              "Check your spam folder. Ensure your email is spelled correctly. If the issue continues, contact support.",
        ),
        _faqItem(
          question: "How can I delete my account?",
          answer:
              "Please contact support if you want to permanently delete your account. We will guide you through the process.",
        ),
        _faqItem(
          question: "How do I enable notifications?",
          answer:
              "Go to your phone settings → App permissions → Enable notifications for this app.",
        ),
        _faqItem(
          question: "Is my personal information safe?",
          answer:
              "Yes. Your data is encrypted and protected according to industry-standard security policies.",
        ),
      ],
    );
  }

  // ---------------- FAQ ITEM ----------------
  Widget _faqItem({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6D3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        iconColor: const Color(0xFF8B4513),
        collapsedIconColor: const Color(0xFF8B4513),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              answer,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- CONTACT TILE ----------------
  Widget _contactTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1EC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, size: 30, color: const Color(0xFF78350F)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: subtitle != null
            ? Text(subtitle, style: const TextStyle(color: Colors.black54))
            : null,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
