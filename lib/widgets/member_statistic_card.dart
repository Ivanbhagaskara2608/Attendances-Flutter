import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject_member.dart';
import 'package:flutter_application_1/widgets/small_dropdown.dart';
import 'package:flutter_application_1/widgets/small_textfield_custom.dart';

class StatisticMemberCard extends StatelessWidget {
  final SubjectMember member;
  StatisticMemberCard(this.member);

  @override
  Widget build(BuildContext context) {
    Color statusBackgroundColor = (() {
      switch (member.status) {
        case "P":
          return Color.fromARGB(255, 158, 255, 150);
        case "L":
          return Color.fromARGB(255, 225, 220, 108);
        case "S":
          return Color.fromARGB(255, 204, 204, 204);
        case "A":
          return Color.fromARGB(255, 255, 177, 199);
        default:
          return Color.fromARGB(
              255, 122, 173, 223); // atau warna default lainnya
      }
    })();

    Color statusTextColor = (() {
      switch (member.status) {
        case "P":
          return Color.fromARGB(255, 15, 175, 1);
        case "L":
          return Color.fromARGB(255, 175, 134, 1);
        case "S":
          return Color.fromARGB(255, 66, 66, 66);
        case "A":
          return Color.fromARGB(255, 190, 0, 57);
        default:
          return Color.fromARGB(255, 44, 62, 80); // atau warna default lainnya
      }
    })();

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogChangeStatus(member);
              });
        },
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 18,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          member.fullname,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          member.email,
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      member.joinDate,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundColor: statusBackgroundColor,
                    maxRadius: 18,
                    child: Text(
                      member.status.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: statusTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Divider(
                height: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DialogChangeStatus extends StatelessWidget {
  final SubjectMember member;
  final List<String> statusItems = [
    'Leave',
    'Sick',
  ];
  String? selectedValue;
  DialogChangeStatus(this.member, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("assets/icon_warning.png", width: 80, height: 80),
          SizedBox(
            height: 10,
          ),
          Text(
            "Are you sure?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 175, 134, 1)),
          ),
          Text('${member.fullname} status will change'),
          SizedBox(
            height: 20,
          ),
          SmallDropDown(
              items: statusItems,
              selectedValue: selectedValue,
              hintText: "-- Status --"),
          SizedBox(
            height: 15,
          ),
          SmallCustomTextFIeld("Reason"),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Color.fromARGB(255, 44, 62, 80), width: 1)),
            child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  )),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 199, 0, 57),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Yes, I'm sure!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 44, 62, 80),
                    minimumSize: Size.fromHeight(35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
                ),
              ))
            ],
          ),
        ]),
      ),
    );
  }
}
