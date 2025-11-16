import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062355),
      body: Stack(
        children: [
          // ---------------------- BLOB BACKGROUNDS ----------------------
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

          // ---------------------- MAIN CONTENT ----------------------
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  Row(
                    children: [
                      Image.asset("assets/icons/money.png", height: 60),
                      const SizedBox(width: 10),
                      const Text(
                        "Transaction\nHistory",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // BALANCE + WITHDRAW CARD ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_balanceCard(), _withdrawCard()],
                  ),

                  const SizedBox(height: 20),
                  _seeAllButton(),

                  const SizedBox(height: 10),
                  // ---------------------- TRANSACTION LIST ----------------------
                  _transactionTile(
                    isIncome: true,
                    title: "Cabinet Fitting",
                    subtitle: "Sent by Jia • nov 12",
                    amount: "650",
                  ),
                  _transactionTile(
                    isIncome: true,
                    title: "Door Installation",
                    subtitle: "Sent by Hamza Khan • nov 5",
                    amount: "1100",
                  ),
                  _transactionTile(
                    isIncome: false,
                    title: "Platform fee",
                    subtitle: "Deducted by HUNAR • oct 27",
                    amount: "250",
                  ),
                  _transactionTile(
                    isIncome: true,
                    title: "Staircase construction",
                    subtitle: "Sent by Ahmed • oct 12",
                    amount: "2700",
                  ),
                  _transactionTile(
                    isIncome: true,
                    title: "Polishing & Varnishing",
                    subtitle: "Sent by Omer • aug 12",
                    amount: "1850",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------- WIDGETS ----------------------

  // BLOB BACKGROUND
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

  // BALANCE CARD
  static Widget _balanceCard() {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF062355),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF78350F), width: 2),
      ),
      child: Column(
        children: const [
          Text(
            "Rs. 2615.37",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Account Balance",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // WITHDRAW CARD
  static Widget _withdrawCard() {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF062355),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF78350F), width: 2),
      ),
      child: Column(
        children: [
          Image.asset("assets/icons/bank.png", height: 50),
          const SizedBox(height: 10),
          const Text(
            "Withdrawal\nOptions",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // SEE ALL BUTTON
  static Widget _seeAllButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "See all",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // TRANSACTION TILE
  static Widget _transactionTile({
    required bool isIncome,
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1EC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            isIncome ? Icons.arrow_upward : Icons.arrow_downward,
            color: isIncome ? Colors.green : Colors.red,
            size: 30,
          ),
          const SizedBox(width: 12),

          // TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),

          // AMOUNT
          Text(
            "Rs. $amount",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
