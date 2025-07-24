import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/screens/student_dashboard.dart';
import 'package:testapp/screens/studyMaterial.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/notice.dart';
import 'package:testapp/widgets/course_builtrow.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
        appBar: CustomAppBar(title: 'Result'),
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
                    CourseBuiltrow(label: 'Student Name :', value: 'Navya'),
                    SizedBox(height: 4),
                    CourseBuiltrow(
                      label: 'Roll No. :',
                      value: 'PBR/24/12/ADCA-192/8',
                    ),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Reg.ID :', value: 'VC24F29B5'),
                    SizedBox(height: 4),
                    CourseBuiltrow(
                      label: 'Test Name :',
                      value: 'CHAPTER-15-GST',
                    ),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Test Date :', value: '18/01/2025'),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Test Time :', value: '10:54 AM'),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Marks Obtained :', value: '44'),
                    SizedBox(height: 4),
                    CourseBuiltrow(label: 'Total Marks :', value: '50'),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: PRIME_ORANGE, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CourseBuiltrow(
                  label: 'Batch Name :',
                  value: 'TP08 - 29/03/2025',
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
