import 'package:flutter/material.dart';

import '../initial_data.dart';
import '../user_login_in/common/theme_helper.dart';

class StudentParentDetailPage extends StatefulWidget {
  const StudentParentDetailPage({Key? key}) : super(key: key);

  @override
  State<StudentParentDetailPage> createState() =>
      _StudentParentDetailPageState();
}

class _StudentParentDetailPageState extends State<StudentParentDetailPage> {
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
              onChanged: (value) {
                InitialData.studentData['fatherPhoneNo'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Father PhoneNo',
                  hintText: 'Enter your Father Phone No'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['fatherEmail'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Father Email',
                  hintText: 'Enter your Father Email'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['motherPhoneNo'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Mother PhoneNo',
                  hintText: 'Enter your Mother Phone No'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['motherEmail'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Mother Email',
                  hintText: 'Enter your Mother Email'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['guardianPhoneNo'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Guardian PhoneNo',
                  hintText: 'Enter your Guardian Phone No'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['guardianEmail'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Guardian Email',
                  hintText: 'Enter your Mother Email'),
            ),
          ],
        ),
      ),
    );
  }
}
