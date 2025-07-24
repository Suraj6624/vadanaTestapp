import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/widgets/course_builtrow.dart';
import 'package:testapp/widgets/test_result.dart';
import 'package:testapp/screens/student_dashboard.dart';
import 'package:testapp/screens/studyMaterial.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/notice.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => StudentDashboard()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Studymaterial()),
        );
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Payment()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Notice()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Test'),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: PRIME_ORANGE, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CourseBuiltrow(
                      label: 'Test Name :',
                      value: 'CHAPTER-15-GST',
                    ),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Batch :', value: 'TPQ8-29/03/2025'),
                    SizedBox(height: 4),
                    CourseBuiltrow(
                      label: 'Date&Time  :',
                      value: '18/01/2081 10:54 AM',
                    ),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Status :', value: 'Submitted'),
                    SizedBox(height: 4),
                    TestBuiltrow(label: 'Action :', value: 'View Result'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: PRIMARY_COLOR),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) => _navigateToPage(context, index),

            selectedItemColor: PRIME_WHITE,
            unselectedItemColor: PRIME_WHITE,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.payment), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
