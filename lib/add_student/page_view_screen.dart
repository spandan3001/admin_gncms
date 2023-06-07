import 'package:admin_gncms/add_student/student_college_details_page.dart';
import 'package:admin_gncms/add_student/student_detail_page.dart';
import 'package:admin_gncms/add_student/student_parents_details_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);
  static const id = '/add_student_screen';

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              StudentCollegeDetailPage(),
              StudentDetailPage(),
              StudentParentDetailPage(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.95),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
            ),
          )
        ],
      ),
    );
  }
}
