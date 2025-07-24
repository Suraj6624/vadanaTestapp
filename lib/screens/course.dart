import 'package:flutter/material.dart';
import 'package:testapp/providers/course_list_provider.dart';
import 'package:testapp/providers/get_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/widgets/searchbar.dart';
import 'package:testapp/widgets/course_builtrow.dart';
import 'package:testapp/screens/studyMaterial.dart';
import 'package:testapp/screens/student_dashboard.dart';
import 'package:testapp/controllers/course_controller.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/notice.dart';

class Course extends ConsumerStatefulWidget {
  const Course({super.key});

  @override
  ConsumerState<Course> createState() => _CourseState();
}

class _CourseState extends ConsumerState<Course> {
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
    final userSync = ref.watch(getUserInfoProvider);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Course'),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(height: 24),
              userSync.when(
                loading: () {
                  return CircularProgressIndicator();
                },
                error: (error, stackTrace) {
                  return CircularProgressIndicator();
                },
                data: (data) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: PRIME_ORANGE, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      children: [
                        CourseBuiltrow(label: 'Course Name :', value: 'ADCA'),
                        CourseBuiltrow(
                          label: 'Starting Date  :',
                          value: '12-8-2025',
                        ),
                        CourseBuiltrow(
                          label: 'Starting Date   :',
                          value: '12-8-2025',
                        ),
                        CourseBuiltrow(label: 'Mode :', value: 'Offline'),
                        CourseBuiltrow(label: 'Course Fee :', value: '6500/-'),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: PRIME_ORANGE, width: 2),
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
                        color: PRIME_ORANGE,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'View Notes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: PRIME_WHITE,
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
