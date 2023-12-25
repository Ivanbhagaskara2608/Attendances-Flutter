import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subscription_history.dart';
import 'package:flutter_application_1/widgets/subscription_history_card.dart';

class SubscriptionHistoriesPage extends StatelessWidget {
  const SubscriptionHistoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subscription Historiest",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 44, 62, 80)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 44, 62, 80)),
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: subscriptionHistories.length,
        itemBuilder: (context, index) {
          SubscriptionHistory historyData = subscriptionHistories[index];

          return SubscriptionHistoryCard(historyData);
        },
      ),
    );
  }
}
