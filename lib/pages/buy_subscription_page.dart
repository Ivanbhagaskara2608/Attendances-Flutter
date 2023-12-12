import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subscription_package.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuySubscriptionPage extends StatefulWidget {
  const BuySubscriptionPage({super.key});

  @override
  State<BuySubscriptionPage> createState() => _BuySubscriptionPageState();
}

class _BuySubscriptionPageState extends State<BuySubscriptionPage> {
  String access = "3 Month Access";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Center(
          child: ListView(
            children: [
              Column(children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 158, 255, 150),
                  child: Icon(
                    FontAwesomeIcons.crown,
                    color: Color.fromARGB(255, 15, 175, 1),
                    size: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                    "Buy Premium",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 175, 1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    "Rp50.000 - Rp1.000.000",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Select Subscription Package",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: DropdownButtonFormField(
                    dropdownColor: Color.fromARGB(255, 175, 134, 1),
                    value: subscriptionPackages[0],
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 175, 134, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none)),
                    items: subscriptionPackages
                        .map((item) => DropdownMenuItem<SubscriptionPackage>(
                              value: item,
                              child: Row(
                                children: [
                                  Text(
                                    "${item.type} - ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 220, 108)),
                                  ),
                                  Text(
                                    "Rp${item.price}",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        final package = (value as SubscriptionPackage).type;
                        if (package == "Quarter") {
                          access = "3 Month Access";
                        } else if (package == "Semi-Annual") {
                          access = "6 Month Access";
                        } else if (package == "Annual") {
                          access = "1 Year Access";
                        } else if (package == "Lifetime") {
                          access = "Lifetime Access";
                        }
                      });
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 44, 62, 80),
                        child: Icon(
                          FontAwesomeIcons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        access,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 44, 62, 80),
                        child: Icon(
                          FontAwesomeIcons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "All Free Resources",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 44, 62, 80),
                        child: Icon(
                          FontAwesomeIcons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Unlimited Subjects",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 44, 62, 80),
                      minimumSize: Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.headset_mic_rounded,
                        color: Color.fromARGB(255, 44, 62, 80),
                      ),
                      Text(
                        "Need help?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 44, 62, 80)),
                      )
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
