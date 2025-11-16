import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062355),
      body: Stack(
        children: [
          _blob(
            top: -120,
            left: -80,
            size: 350,
            color: const Color(0x444A90E2),
            blur: 90,
          ),
          _blob(
            bottom: -140,
            left: -80,
            size: 400,
            color: const Color(0x4478350F),
            blur: 110,
          ),
          _blob(
            top: 200,
            right: -100,
            size: 280,
            color: const Color(0x33F4F1EC),
            blur: 80,
          ),
          _blob(
            top: 300,
            left: -60,
            size: 240,
            color: const Color(0x3380B7FF),
            blur: 85,
          ),
          _blob(
            bottom: 100,
            right: -60,
            size: 300,
            color: const Color(0x3378350F),
            blur: 85,
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------------- HEADER ----------------
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Payment\nSettings",
                        style: GoogleFonts.getFont(
                          'Abril Fatface',
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ---------------- BALANCE CARD ----------------
                  _balanceCard(),

                  const SizedBox(height: 25),

                  Text(
                    "Payment Methods",
                    style: GoogleFonts.getFont(
                      'Abril Fatface',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _paymentMethodTile(
                    icon: Icons.account_balance_wallet,
                    method: "Easypaisa",
                    subtitle: "0345 ••••••87",
                    selected: true,
                  ),
                  _paymentMethodTile(
                    icon: Icons.account_balance_wallet,
                    method: "JazzCash",
                    subtitle: "0301 ••••••44",
                    selected: false,
                  ),
                  _paymentMethodTile(
                    icon: Icons.account_balance,
                    method: "Bank Transfer",
                    subtitle: "HBL •••• 1122",
                    selected: false,
                  ),

                  const SizedBox(height: 20),
                  _addMethodButton(),

                  const SizedBox(height: 35),

                  Text(
                    "Security",
                    style: GoogleFonts.getFont(
                      'Abril Fatface',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _settingTile(
                    title: "Set Payment PIN",
                    icon: Icons.lock_outline,
                    onTap: () {},
                  ),

                  _settingTile(
                    title: "Enable Auto Withdrawal",
                    icon: Icons.autorenew,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- BLOB BACKGROUND ----------------------
  static Widget _blob({
    required double size,
    required Color color,
    double? top,
    double? left,
    double? right,
    double? bottom,
    double blur = 50,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(color: color, blurRadius: blur, spreadRadius: blur / 2),
          ],
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // ---------------------- BALANCE CARD ----------------------
  Widget _balanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF062355),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF78350F), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Balance",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            "Rs. 2615.37",
            style: GoogleFonts.getFont(
              'Abril Fatface',
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- PAYMENT METHOD TILE ----------------------
  Widget _paymentMethodTile({
    required IconData icon,
    required String method,
    required String subtitle,
    required bool selected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1EC),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: selected ? const Color(0xFF78350F) : Colors.transparent,
          width: selected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: const Color(0xFF78350F)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Icon(
            selected ? Icons.check_circle : Icons.radio_button_unchecked,
            color: selected ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }

  // ---------------------- ADD PAYMENT METHOD BUTTON ----------------------
  Widget _addMethodButton() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Text(
          "Add New Method",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      ),
    );
  }

  // ---------------------- SECURITY SETTING TILE ----------------------
  Widget _settingTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        tileColor: const Color(0xFFF4F1EC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Icon(icon, color: const Color(0xFF78350F)),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
