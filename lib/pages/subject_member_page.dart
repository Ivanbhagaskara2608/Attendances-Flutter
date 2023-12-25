import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/subject.dart';
import 'package:flutter_application_1/model/subject_member.dart';
import 'package:flutter_application_1/widgets/member_card.dart';

class SubjectMemberPage extends StatelessWidget {
  final Subject currentSubject;
  const SubjectMemberPage(this.currentSubject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Member : ${subjectMembers.length}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: subjectMembers.length,
              itemBuilder: (context, index) {
                SubjectMember member = subjectMembers[index];

                return MemberCard(member.fullname, member.email,
                    member.joinDate, member.role, currentSubject.type);
              },
            ))
          ],
        ),
      ),
    );
  }
}
