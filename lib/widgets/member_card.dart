import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String fullname;
  final String email;
  final String joinDate;
  final String role;
  final String type;

  MemberCard(this.fullname, this.email, this.joinDate, this.role, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        fullname,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        email,
                        style: TextStyle(
                            fontSize: 10, fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    joinDate,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (type == "created")
                    PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Color.fromARGB(255, 44, 62, 80),
                        ),
                        itemBuilder: (context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                                child: ListTile(
                              title: Text("Edit Access"),
                              onTap: () {
                                print("Edit Access");
                              },
                            )),
                            PopupMenuItem(
                                child: ListTile(
                              title: Text(
                                "Kick Member",
                                style: TextStyle(
                                  color: Colors.red, // Warna merah
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DialogKickMember(fullname);
                                    });
                              },
                            ))
                          ];
                        }),
                  Text(
                    role,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
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

class DialogKickMember extends StatelessWidget {
  final String fullname;

  const DialogKickMember(this.fullname, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 70),
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
          Text(
            "You will be kick this user",
            textAlign: TextAlign.center,
          ),
          Text(
            fullname,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
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
                  "Kick",
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
