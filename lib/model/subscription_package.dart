class SubscriptionPackage {
  final String type;
  final int price;

  SubscriptionPackage(this.type, this.price);
}

List subscriptionPackages = [
  SubscriptionPackage("Quarter", 50000),
  SubscriptionPackage("Semi-Annual", 65000),
  SubscriptionPackage("Annual", 100000),
  SubscriptionPackage("Lifetime", 1000000),
];