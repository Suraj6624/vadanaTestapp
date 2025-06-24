import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/builtrow.dart';
import 'package:testapp/widgets/builtrowandelevation.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  Widget _buildDrawerItem(String title, IconData icon, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Color.fromARGB(255, 24, 95, 171)),
      title: Text(
        title,
        style: TextStyle(color: Color.fromARGB(255, 43, 41, 41)),
      ),
      onTap:
          onTap ??
          () {
            Navigator.pop(context); // Closes the drawer
          },
    );
  }

  Widget _buildPaymentRow(
    BuildContext context,
    IconData icon,
    String label,
    String amount,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,

      child: Card(
        color: Colors.white,

        elevation: 3,

        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            border: Border(left: BorderSide(width: 5.0, color: PRIME_ORANGE)),
          ),

          child: Column(
            children: [
              Row(
                children: [
                  Icon(icon, color: PRIME_BLUE),
                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: PRIME_BLACK,
                      ),
                      softWrap: true,

                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
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
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              SizedBox(height: 16),
              _buildDrawerItem('Home', Icons.home),

              _buildDrawerItem('Courses', Icons.menu_book),

              _buildDrawerItem('Payment', Icons.payment),

              _buildDrawerItem('Study Material', Icons.import_contacts),

              _buildDrawerItem('Test', Icons.text_snippet),
              _buildDrawerItem('Notice', Icons.notifications),

              _buildDrawerItem('Contact', Icons.phone),

              _buildDrawerItem(
                'Logout',
                Icons.logout,
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  Navigator.pop(context); // Navigate back to login
                },
              ),
            ],
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the side drawer
            },
          ),
        ),
        title: Image.network(
          "https://vfpatna.com/assets/vf_logo.png", // Center logo
          height: 40,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                Card(
                  color: Colors.white, // Background color
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Image section
                        Container(
                          height: 100,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://vfpatna.com/assets/mUpload/1735040000NAVYA.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 24), // Spacing
                        // Text section with icons
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 24, 95, 171),
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Nikita Rathor singh",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: PRIME_BLACK,
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
                                    color: PRIME_BLACK,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.book,
                                  color: Colors.indigo,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Course: ADCA",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: PRIME_BLACK,
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
                SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                SizedBox(height: 12),
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.only(right: 4, left: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment History",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PRIME_BLACK,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: PRIME_BLACK,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuiltRow(
                                icon: Icons.receipt_long,
                                label: "Transaction",
                                value: "TRN/22852",
                                iconColor: Colors.deepOrange,
                              ),

                              // Transaction ID
                              SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.payment,
                                label: "Payment Mode",
                                value: "Full Payment",
                                iconColor: Colors.teal,
                              ),

                              // Payment Mode
                              SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.currency_rupee,
                                label: "Amount",
                                value: "₹ 6500",
                                iconColor: Colors.green,
                              ),

                              // Amount
                              SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.calendar_today,
                                label: "Date",
                                value: "24 Dec 2024",
                                iconColor: Colors.blueGrey,
                              ),

                              // Date
                            ],
                          ),
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
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuiltRow(
                                icon: Icons.receipt_long,
                                label: "Transaction ID",
                                value: "TRN/22852",
                                iconColor: Colors.deepOrange,
                              ),

                              // Transaction ID
                              SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.payment,
                                label: "Payment Mode",
                                value: "Full Payment",
                                iconColor: Colors.teal,
                              ),

                              // Payment Mode
                              SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.currency_rupee,
                                label: "Amount",
                                value: "₹ 6500",
                                iconColor: Colors.green,
                              ),

                              // Amount
                              SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.calendar_today,
                                label: "Date",
                                value: "24 Dec 2024",
                                iconColor: Colors.blueGrey,
                              ),

                              // Date
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,

                  padding: EdgeInsets.only(right: 4, left: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Test",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: PRIME_BLACK,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: PRIME_BLACK,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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

                              // Batch
                              const SizedBox(height: 12),

                              BuiltRow(
                                icon: Icons.calendar_month,
                                label: "Date & Time",
                                value: "08/02/2025 09:00 AM",
                                iconColor: Colors.orange,
                              ),

                              // Date & Time
                              const SizedBox(height: 12),

                              BuiltRow(
                                icon: Icons.check_circle,
                                label: "Status",
                                value: "Submitted",
                                iconColor: Colors.green,
                              ),

                              // Status
                              const SizedBox(height: 12),

                              // Action Button
                              Builtrowandelevation(
                                icon: Icons.visibility,
                                label: "Action",
                                iconColor: Colors.blueGrey,

                                trailing: ElevatedButton(
                                  onPressed: () {
                                    // Handle view result action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: PRIME_BLUE,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text("View Result"),
                                ),
                              ),
                            ],
                          ),
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
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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

                              // Batch
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.calendar_month,
                                label: "Date & Time",
                                value: "008/02/25 9:00 AM",
                                iconColor: Colors.orange,
                              ),

                              // Date & Time
                              const SizedBox(height: 12),
                              BuiltRow(
                                icon: Icons.check_circle,
                                label: "Status",
                                value: "Submitted",
                                iconColor: Colors.green,
                              ),

                              // Status
                              const SizedBox(height: 12),
                              Builtrowandelevation(
                                icon: Icons.visibility,
                                label: "Action",
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    // Handle view result action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: PRIME_BLUE,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text("View Result"),
                                ),
                                iconColor: Colors.blueGrey,
                              ),

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
