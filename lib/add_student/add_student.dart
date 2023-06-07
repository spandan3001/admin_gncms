import 'package:admin_gncms/initial_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../user_login_in/common/theme_helper.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  static const id = '/add_student';

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  bool isValid(Map<String, String> studentData) {
    for (var data in studentData.values) {
      if (data.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextField(
                          onChanged: (String value) {
                            InitialData.studentData['firstName'] = value;
                          },
                          decoration: ThemeHelper().textInputDecoration(
                              lableText: 'First Name',
                              hintText: 'Enter your First Name'),
                        ),
                        const SizedBox(height: 30.0),
                        TextField(
                          onChanged: (value) {
                            InitialData.studentData['lastName'] = value;
                          },
                          decoration: ThemeHelper().textInputDecoration(
                              lableText: 'Last Name',
                              hintText: 'Enter your Last Name'),
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
                              lableText: 'PhoneNo',
                              hintText: 'Enter your Phone No'),
                        ),
                        const SizedBox(height: 30.0),
                        TextField(
                          onChanged: (value) {
                            InitialData.studentData['email'] = value;
                          },
                          decoration: ThemeHelper().textInputDecoration(
                              lableText: 'Email', hintText: 'Enter your Email'),
                        ),
                        const SizedBox(height: 30.0),
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
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 6) / 100,
              child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(Colors.black),
                  child: Text(
                    'Submit'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    if (isValid(InitialData.studentData)) {
                      var snap = FirebaseFirestore.instance
                          .collection('student')
                          .doc(InitialData.studentData['usn']);
                      snap.set(InitialData.studentData);
                      Navigator.pop(context);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
