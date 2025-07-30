import 'package:flutter/material.dart';
import 'package:testapp/screens/result.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/widgets/course_builtrow.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Test extends ConsumerStatefulWidget {
  const Test({super.key});

  @override
  ConsumerState<Test> createState() => _TestState();
}

class _TestState extends ConsumerState<Test> {
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
                    SizedBox(height: 8),
                    CourseBuiltrow(label: 'Batch :', value: 'TPQ8-29/03/2025'),
                    SizedBox(height: 8),
                    CourseBuiltrow(
                      label: 'Date&Time  :',
                      value: '18/01/2081 10:54 AM',
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status :",
                            style: TextStyle(
                              fontSize: 14,
                              color: PRIME_BLACK,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Submitted",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: PRIME_BLACK,
                                  ),
                                ),

                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            Scaffold(body: Result()),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: PRIME_BLACK,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
