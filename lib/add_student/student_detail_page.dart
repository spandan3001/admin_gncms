import 'package:flutter/material.dart';

import '../initial_data.dart';
import '../user_login_in/common/theme_helper.dart';

class StudentDetailPage extends StatefulWidget {
  const StudentDetailPage({Key? key}) : super(key: key);

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                InitialData.studentData['firstName'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'First Name', hintText: 'Enter your First Name'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['lastName'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Last Name', hintText: 'Enter your Last Name'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['usn'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'USN', hintText: 'Enter your USN'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['phoneNo'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'PhoneNo', hintText: 'Enter your Phone No'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['email'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Email', hintText: 'Enter your Email'),
            ),
          ],
        ),
      ),
    );
  }
}
