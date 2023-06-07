import 'package:admin_gncms/add_student/add_student.dart';
import 'package:admin_gncms/custom_widgets/small_card.dart';
import 'package:admin_gncms/user_login_in/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_student/page_view_screen.dart';
import 'initial_data.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  static const id = '/HomeScreen';

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              "ADMIN",
              style: TextStyle(color: Colors.white),
            ),
            //leading: Icon(Icons.man),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PopupMenuButton(
                  shadowColor: Colors.black,
                  icon: const Icon(Icons.account_circle,
                      size: 40, color: Colors.grey),
                  splashRadius: 20,
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text('👤Profile'),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('🌐Web Login'),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text('🔑Change Password'),
                    ),
                    const PopupMenuItem<int>(
                      value: 3,
                      child: Text('🔙 Logout'),
                    ),
                  ],
                  onSelected: (item) => selectedItem(context, item),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height / 5),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 120),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    crossAxisCount: 3,
                    children: [
                      CardWidget(
                          icon: Icons.add,
                          cardName: "Add Student",
                          onPressed: () {
                            Navigator.pushNamed(context, AddStudentScreen.id);
                          },
                          iconColor: Colors.black12)
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  selectedItem(BuildContext context, int item) async {
    switch (item) {
      case 0:
        //Navigator.pushNamed(context, ProfileCardScreen.id);
        break;
      case 3:
        FirebaseAuth.instance.signOut();
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.id, (route) => false);
        await InitialData.initGlobalData();
        break;
    }
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();

    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width / 2, height + 40, width, height - 40);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
