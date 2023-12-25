import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subscription_history.dart';

class SubscriptionHistoryCard extends StatelessWidget {
  final SubscriptionHistory historyData;

  const SubscriptionHistoryCard(this.historyData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 21, left: 21, top: 25),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 44, 62, 80),
                    maxRadius: 18,
                    child: Icon(
                      Icons.receipt_long,
                      color: Colors.white,
                      size: 19,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historyData.packageName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    historyData.referenceNumber,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    historyData.date,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    historyData.price,
                    style: TextStyle(fontSize: 8),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Divider(
              height: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
