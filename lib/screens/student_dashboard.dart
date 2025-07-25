import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/controllers/course_controller.dart';
import 'package:testapp/providers/course_list_provider.dart';
import 'package:testapp/providers/get_user_provider.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/builtrow.dart';
import 'package:testapp/screens/course.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/test.dart';

class StudentDashboard extends ConsumerStatefulWidget {
  const StudentDashboard({super.key});

  @override
  ConsumerState<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends ConsumerState<StudentDashboard> {
  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon, {
    VoidCallback? onTap,
    Widget? nextPage, // 👈 Optional destination page
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

      child: InkWell(
        onTap:
            onTap ??
            () {
              Navigator.pop(context);
              if (nextPage != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage),
                );
              }
            },
        child: Row(
          children: [
            Row(
              children: [
                Icon(icon, color: PRIME_BLUE),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: PRIMAY_BLACK),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: PRIME_BLACK),
          ],
        ),
      ),
    );
  }

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
              Icon(icon, color: PRIME_BLUE),

              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: PRIME_BLACK,
                ),
              ),

              Text(
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
    final courses = ref.watch(getCourseListProvider);
    final userSync = ref.watch(getUserInfoProvider);

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          backgroundColor: background_color,
          child: SafeArea(
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
                      color: PRIME_BLUE,
                      height: 200,

                      child: Row(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: PRIME_WHITE,
                              border: Border(
                                bottom: BorderSide(
                                  color: PRIMARY_COLOR,
                                  width: 10,
                                ),
                                top: BorderSide(
                                  color: PRIMARY_COLOR,
                                  width: 10,
                                ),
                                right: BorderSide(
                                  color: PRIMARY_COLOR,
                                  width: 10,
                                ),
                                left: BorderSide.none,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  140,
                                ), // makes top-right corner rounded
                                bottomRight: Radius.circular(
                                  140,
                                ), // makes bottom-right corner rounded
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 100,

                              decoration: BoxDecoration(
                                color: PRIME_WHITE,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                    100,
                                  ), // makes top-right corner rounded
                                  bottomRight: Radius.circular(
                                    100,
                                  ), // makes bottom-right corner rounded
                                ),
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: PRIME_ORANGE,
                                    width: 3,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://m6.wamarket.cloud${data!.image}',
                                    ),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hello',
                                  style: TextStyle(color: PRIME_WHITE),
                                ),
                                Text(
                                  '${data!.name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: PRIME_WHITE,
                                  ),
                                ),
                                Text(
                                  '${data.autoStuId}',
                                  style: TextStyle(color: PRIME_WHITE),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 8),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Home',
                            Icons.home,
                            nextPage: StudentDashboard(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Courses',
                            Icons.menu_book,
                            nextPage: Course(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Payment',
                            Icons.payment,
                            nextPage: Payment(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Study Material',
                            Icons.import_contacts,
                            nextPage: StudentDashboard(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Test',
                            Icons.text_snippet,
                            nextPage: Test(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Notice',
                            Icons.notifications,
                            nextPage: StudentDashboard(),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          color: PRIME_WHITE,
                          child: _buildDrawerItem(
                            context,
                            'Contact',
                            Icons.phone,
                            nextPage: StudentDashboard(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 8,
                    right: 16,
                    bottom: 8,
                    left: 16,
                  ),
                  color: PRIME_WHITE,
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: PRIMARY_COLOR),
                        SizedBox(width: 8),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                        Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: PRIME_BLACK,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

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
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: PRIMARY_COLOR,
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
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "ID: ${data.autoStuId}",
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
                                      'https://m6.wamarket.cloud${data!.image}',
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
                            _buildPaymentRow(
                              context,
                              Icons.school,
                              "Course Fee",
                              "₹ 6500",
                            ),

                            _buildPaymentRow(
                              context,
                              Icons.payments,
                              "Total Paid",
                              "₹ 6500",
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
                            _buildPaymentRow(
                              context,
                              Icons.account_balance_wallet,
                              "Due Amount",
                              "₹ 0",
                            ),

                            _buildPaymentRow(
                              context,
                              Icons.add_card,
                              "Add Payment",
                              "₹ 0",
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
                    top: 4,
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
                        padding: EdgeInsets.only(right: 8, bottom: 8, left: 8),
                        decoration: BoxDecoration(
                          color: PRIME_BLUE,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Recent Payment',
                          style: TextStyle(color: PRIME_WHITE),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Course Fee ₹6500/- :',
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
                                Text('Fully Paid'),
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
