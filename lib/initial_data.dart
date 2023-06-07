import 'dart:convert';
import 'package:admin_gncms/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

InitialData globalObj = InitialData();
late SharedPreferences prefs;

class InitialData {
  static String globalUserId = "";
  static String _currentUser = "";
  static Map<String, String> studentData = {
    'firstName': '',
    'lastName': '',
    'usn': '',
    'phoneNo': '',
    'email': '',
    'fatherPhoneNo': '',
    'fatherEmail': '',
    'motherPhoneNo': '',
    'motherEmail': '',
    'guardianPhoneNo': '',
    'guardianEmail': ''
  };

  static Future<void> initGlobalData() async {
    globalUserId = "";
    String _currentUser = "";
    await globalObj.writeInitGlobalData();
  }

  Future<void> getUser() async {}

  Future<void> writeLocalData({
    required String email,
  }) async {
    await initLocalData();
    String data = jsonEncode({'email': email});
    await prefs.setString('currentUser', data);
    //print(data);
  }

  Future<void> initLocalData() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> writeInitGlobalData() async {
    initLocalData();
    await prefs.remove('currentUser');
  }

  void getLocalData() {
    _currentUser = prefs.getString('currentUser') ?? "";
  }
}
