import 'package:flutter/material.dart';

import '../initial_data.dart';
import '../user_login_in/common/theme_helper.dart';

class StudentCollegeDetailPage extends StatefulWidget {
  const StudentCollegeDetailPage({Key? key}) : super(key: key);

  @override
  State<StudentCollegeDetailPage> createState() =>
      _StudentCollegeDetailPageState();
}

class _StudentCollegeDetailPageState extends State<StudentCollegeDetailPage> {
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
                InitialData.studentData['batch'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Batch', hintText: 'Enter Batch Year'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['branch'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Branch', hintText: 'Enter Branch'),
            ),
            const SizedBox(height: 30.0),
            TextField(
              onChanged: (value) {
                InitialData.studentData['section'] = value;
              },
              decoration: ThemeHelper().textInputDecoration(
                  lableText: 'Section', hintText: 'Enter Section'),
            ),
          ],
        ),
      ),
    );
  }
}
