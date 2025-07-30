import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/controllers/auth_controller.dart';
import 'package:testapp/repositoy/auth_repository.dart';
import 'package:testapp/screens/adca.dart';
import 'package:testapp/screens/note.dart';
import 'package:testapp/screens/payment.dart';
import 'package:testapp/screens/student_dashboard.dart';
import 'package:testapp/screens/test.dart';

import 'package:testapp/providers/get_user_provider.dart';
import 'package:testapp/utils/constant.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
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

  @override
  Widget build(BuildContext context) {
    final userSync = ref.watch(getUserInfoProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        backgroundColor: background_color,

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
                            bottom: BorderSide(color: PRIMARY_COLOR, width: 10),
                            top: BorderSide(color: PRIMARY_COLOR, width: 10),
                            right: BorderSide(color: PRIMARY_COLOR, width: 10),
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
                              border: Border.all(color: PRIME_ORANGE, width: 3),
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
                            Text('Hello', style: TextStyle(color: PRIME_WHITE)),
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
                        nextPage: Adca(),
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
                        nextPage: Notes(),
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
              padding: EdgeInsets.only(top: 8, right: 16, bottom: 8, left: 16),
              color: PRIME_WHITE,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  final repo = ref.watch(authRepositoryProvider);
                  AuthController auth = AuthController(repo);
                  auth.logout(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, color: PRIMARY_COLOR),
                    SizedBox(width: 8),
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 16, color: Colors.redAccent),
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
    );
  }
}
