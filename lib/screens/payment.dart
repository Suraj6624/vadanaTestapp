import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/widgets/course_builtrow.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/widgets/my_bottom_bar.dart';

class Payment extends ConsumerStatefulWidget {
  const Payment({super.key});

  @override
  ConsumerState<Payment> createState() => _PaymentState();
}

class _PaymentState extends ConsumerState<Payment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Payments'),
        bottomNavigationBar: MyBottomBar(currentIndex: 2),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: PRIME_BLACK),
                    ),
                  ),

                  child: Text(
                    'Payment Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CourseBuiltrow(label: 'Course Name :', value: 'ADCA'),
                    CourseBuiltrow(label: 'Course Fee  :', value: '₹6500/-'),
                    CourseBuiltrow(label: 'Due Amount  :', value: '₹6500/-'),
                    CourseBuiltrow(label: 'Mode :', value: '₹0'),
                    CourseBuiltrow(label: 'Add Amount :', value: '₹0'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: PRIME_BLACK),
                    ),
                  ),

                  child: Text(
                    'Transaction Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    CourseBuiltrow(
                      label: 'Transaction ID :',
                      value: 'TRN/22852',
                    ),
                    CourseBuiltrow(label: 'Payment Mode  :', value: 'Online'),
                    CourseBuiltrow(label: 'Amount Paid  :', value: '₹6500/-'),
                    CourseBuiltrow(
                      label: 'Date Of Payment :',
                      value: '24-12-2024',
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
