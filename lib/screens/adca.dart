import 'package:flutter/material.dart';

import 'package:testapp/providers/get_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/screens/note.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';

import 'package:testapp/widgets/course_builtrow.dart';
import 'package:testapp/widgets/my_bottom_bar.dart';

class Adca extends ConsumerStatefulWidget {
  const Adca({super.key});

  @override
  ConsumerState<Adca> createState() => _AdcaState();
}

class _AdcaState extends ConsumerState<Adca> {
  @override
  Widget build(BuildContext context) {
    final userSync = ref.watch(getUserInfoProvider);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'ADCA'),
        backgroundColor: background_color,
        bottomNavigationBar: MyBottomBar(currentIndex: 1),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
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
                      border: Border.all(color: PRIMAY_BLACK),
                      borderRadius: BorderRadius.circular(12),
                      color: PRIME_WHITE,
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
                  border: Border.all(color: PRIMAY_BLACK),
                  color: PRIME_WHITE,
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
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      margin: EdgeInsets.only(right: 20, left: 20),
                      decoration: BoxDecoration(
                        color: PRIME_ORANGE,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Scaffold(body: Notes()),
                            ),
                          );
                        },
                        child: Text(
                          'View Notes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: PRIME_WHITE,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
