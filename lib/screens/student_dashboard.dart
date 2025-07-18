import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/builtrow.dart';
import 'package:testapp/screens/course.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/test.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon, {
    VoidCallback? onTap,
    Widget? nextPage, // 👈 Optional destination page
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                Icon(icon, color: const Color.fromARGB(255, 24, 95, 171)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 43, 41, 41),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
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
        color: Colors.white,

        elevation: 3,

        child: Container(
          width: 120,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            border: Border.all(width: 2.0, color: Colors.orange),
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
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          backgroundColor: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: 200,

                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromARGB(255, 122, 178, 223),
                              width: 10,
                            ),
                            top: BorderSide(
                              color: const Color.fromARGB(255, 122, 178, 223),
                              width: 10,
                            ),
                            right: BorderSide(
                              color: const Color.fromARGB(255, 122, 178, 223),
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
                            color: Colors.white,
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
                                color: Colors.orange,
                                width: 3,
                              ),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://vfpatna.com/assets/mUpload/1735040000NAVYA.jpg',
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
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Nikita Singh Rathor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'VC24F29B5',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                        SizedBox(height: 16),
                        _buildDrawerItem(
                          context,
                          'Home',
                          Icons.home,
                          nextPage: StudentDashboard(),
                        ),
                        _buildDrawerItem(
                          context,
                          'Courses',
                          Icons.menu_book,
                          nextPage: Course(),
                        ),
                        _buildDrawerItem(
                          context,
                          'Payment',
                          Icons.payment,
                          nextPage: Payment(),
                        ),

                        _buildDrawerItem(
                          context,
                          'Study Material',
                          Icons.import_contacts,
                          nextPage: StudentDashboard(),
                        ),

                        _buildDrawerItem(
                          context,
                          'Test',
                          Icons.text_snippet,
                          nextPage: Test(),
                        ),
                        _buildDrawerItem(
                          context,
                          'Notice',
                          Icons.notifications,
                          nextPage: StudentDashboard(),
                        ),

                        _buildDrawerItem(
                          context,
                          'Contact',
                          Icons.phone,
                          nextPage: StudentDashboard(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 0,
                    right: 16,
                    bottom: 16,
                    left: 16,
                  ),
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      print('Tapped!');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 24, 95, 171),
                        ),
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
                          color: Colors.black,
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
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
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
                icon: Icon(
                  Icons.notifications,
                  color: const Color.fromARGB(255, 184, 169, 32),
                ),

                onPressed: () {
                  print("notification clicked");
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Card(
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
                              children: const [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 103, 154, 208),
                                      size: 18,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Nikita Rathor singh",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
                                      "ID: VC24F29B5",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.book,
                                      color: Color.fromARGB(255, 124, 139, 226),
                                      size: 18,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Course: ADCA",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Image (partially outside)
                    Positioned(
                      left: -8, // adjust as needed
                      top: 0, // vertically aligned with card
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 8),
                        ),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 2),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://vfpatna.com/assets/mUpload/1735040000NAVYA.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
                      Container(
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
                      Container(
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
                    border: Border.all(width: 2, color: Colors.orange),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: PRIME_BLUE,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Recent Payment',
                          style: TextStyle(color: Colors.white),
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
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
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
                                iconColor: Colors.deepPurple,
                              ),

                              // Test Name
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.group,
                                label: "Batch",
                                value: "AMIT DCA 9 AM",
                                iconColor: Colors.blueGrey,
                              ),
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.check_circle,
                                label: "Status",
                                value: "Submitted",
                                iconColor: Colors.green,
                              ),
                              // Batch
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.calendar_month,
                                label: "Date & Time",
                                value: "008/02/25 9:00 AM",
                                iconColor: Colors.orange,
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
