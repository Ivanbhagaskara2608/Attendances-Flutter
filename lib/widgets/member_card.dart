import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String fullname;
  final String email;
  final String joinDate;
  final String role;

  MemberCard(this.fullname, this.email, this.joinDate, this.role);

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
                              print("Kick Member");
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
