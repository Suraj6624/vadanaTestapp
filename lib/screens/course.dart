import 'package:flutter/material.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/widgets/searchbar.dart';
import 'package:testapp/widgets/course_builtrow.dart';
import 'package:testapp/screens/studyMaterial.dart';
import 'package:testapp/screens/student_dashboard.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/notice.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
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
        appBar: CustomAppBar(title: 'Course'),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CourseBuiltrow(label: 'Course Name :', value: 'ADCA'),
                    CourseBuiltrow(
                      label: 'Starting Date  :',
                      value: '12-8-2025',
                    ),
                    CourseBuiltrow(label: 'Ending Date  :', value: '12-8-2026'),
                    CourseBuiltrow(label: 'Mode :', value: 'Offline'),
                    CourseBuiltrow(label: 'Course Fee :', value: '6500/-'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Course Realted Notes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 24),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'View Notes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.blue),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) => _navigateToPage(context, index),

            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
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
