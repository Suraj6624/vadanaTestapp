import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testapp/providers/course_list_provider.dart';
import 'package:testapp/providers/get_user_provider.dart';
import 'package:testapp/screens/adca.dart';
import 'package:testapp/screens/drawer.dart';
import 'package:testapp/screens/note.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/utils/app_constants.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/builtrow.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:testapp/widgets/my_bottom_bar.dart';

class StudentDashboard extends ConsumerStatefulWidget {
  const StudentDashboard({super.key});

  @override
  ConsumerState<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends ConsumerState<StudentDashboard> {
  Widget _buildPaymentRow(
    BuildContext context,
    IconData icon,
    String label,
    String amount,
  ) {
    return SizedBox(
      child: Card(
        color: PRIME_WHITE,

        elevation: 3,

        child: Container(
          width: 120,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: PRIME_WHITE,
          ),

          child: Column(
            children: [
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: PRIME_BLUE,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(icon, color: PRIME_WHITE),
              ),

              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: PRIME_BLACK,
                ),
              ),

              amount == ""
                  ? SizedBox(height: 10)
                  : Text(
                      amount,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: PRIME_BLUE,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userSync = ref.watch(getUserInfoProvider);

    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        bottomNavigationBar: MyBottomBar(currentIndex: 0),
        appBar: AppBar(
          backgroundColor: PRIME_WHITE,
          elevation: 2,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: PRIME_BLACK),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens the side drawer
                },
              ),
            ),
          ),

          title: Image.network(
            "https://vfpatna.com/assets/vf_logo.png", // Center logo
            height: 40,
          ),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.notifications, color: PRIME_ORANGE),

                onPressed: () {
                  print("notification clicked");
                },
              ),
            ),
          ],
        ),
        backgroundColor: background_color,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    userSync.when(
                      loading: () {
                        return CircularProgressIndicator();
                      },
                      error: (error, stackTrace) {
                        return CircularProgressIndicator();
                      },
                      data: (data) {
                        return Card(
                          color: PRIME_BLUE,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(24),
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              bottom: 16,
                              left: 32,
                              top: 16,
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: PRIME_WHITE,
                                          size: 18,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "${data!.name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PRIME_WHITE,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.badge,
                                          color: PRIME_WHITE,
                                          size: 18,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "${data.autoStuId}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: PRIME_WHITE,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    /// Image (partially outside)
                    userSync.when(
                      loading: () {
                        return CircularProgressIndicator();
                      },
                      error: (error, stackTrace) {
                        return CircularProgressIndicator();
                      },
                      data: (data) {
                        return InkWell(
                          onTap: () {
                            ref.refresh(getCourseListProvider);
                          },
                          child: Positioned(
                            left: -8, // adjust as needed
                            top: 0, // vertically aligned with card
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: PRIME_WHITE,
                                  width: 8,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: PRIME_ORANGE,
                                    width: 2,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${AppConstants.mainUrl}${data!.image}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 12),

                Container(
                  decoration: BoxDecoration(
                    color: PRIME_BLUE,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => Scaffold(
                                      body: Adca(),
                                      bottomNavigationBar: MyBottomBar(
                                        currentIndex: 1,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: _buildPaymentRow(
                                context,
                                Icons.school,
                                "Courses",
                                "",
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => Scaffold(
                                      body: Payment(),
                                      bottomNavigationBar: MyBottomBar(
                                        currentIndex: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: _buildPaymentRow(
                                context,
                                MdiIcons.currencyRupee,
                                "Payments",
                                "",
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => Scaffold(
                                      body: Notes(),
                                      bottomNavigationBar: MyBottomBar(
                                        currentIndex: 3,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: _buildPaymentRow(
                                context,
                                MdiIcons.note,
                                "Notes",
                                "",
                              ),
                            ),

                            _buildPaymentRow(
                              context,
                              MdiIcons.certificate,
                              "Certificates",
                              "",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 0,
                    right: 8,
                    bottom: 8,
                    left: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: PRIME_WHITE,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          right: 12,
                          bottom: 5,
                          left: 12,
                          top: 5,
                        ),
                        decoration: BoxDecoration(
                          color: PRIME_BLUE,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Recent Payment',
                          style: TextStyle(color: PRIME_WHITE, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Course Name :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('ADCA with Tallyprime'),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount Paid :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: PRIME_WHITE,
                                    size: 12,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text('₹4500'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date Of Payment :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('20-10-2025'),
                          ],
                        ),
                      ),

                      SizedBox(height: 8),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Mode :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Cash'),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),

                SizedBox(height: 16),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: PRIME_BLUE,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 8,
                            left: 8,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: PRIME_WHITE,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Text('Recent Test'),
                              ),
                              BuiltRow(
                                icon: Icons.text_snippet,
                                label: "Test Name",
                                value: "NOTEPAD",
                                iconColor: PRIME_WHITE,
                              ),

                              // Test Name
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.group,
                                label: "Batch",
                                value: "AMIT DCA 9 AM",
                                iconColor: PRIME_WHITE,
                              ),
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.check_circle,
                                label: "Status",
                                value: "Submitted",
                                iconColor: PRIME_WHITE,
                              ),
                              // Batch
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.calendar_month,
                                label: "Date & Time",
                                value: "008/02/25 9:00 AM",
                                iconColor: PRIME_WHITE,
                              ),

                              // Date & Time

                              // Status

                              // Action Button
                            ],
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
      ),
    );
  }
}
