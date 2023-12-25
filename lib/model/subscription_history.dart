class SubscriptionHistory {
  final String packageName;
  final String referenceNumber;
  final String date;
  final String price;

  SubscriptionHistory(this.packageName, this.referenceNumber, this.date, this.price);
}

List subscriptionHistories = [
  SubscriptionHistory("Annual Package", "9f2ba9d7-825c-4537-8144-546a7d76b612", "24 November 2023", "Rp100.000"),
  SubscriptionHistory("Quarter Package", "9f2ba9d7-825c-4537-8144-546a7d76b612", "24 November 2023", "Rp100.000"),
  SubscriptionHistory("Semi-Annual Package", "9f2ba9d7-825c-4537-8144-546a7d76b612", "24 November 2023", "Rp100.000"),
  SubscriptionHistory("Lifetime Package", "9f2ba9d7-825c-4537-8144-546a7d76b612", "24 November 2023", "Rp100.000"),
];