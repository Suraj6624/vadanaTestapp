import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/controllers/auth_controller.dart';

import 'package:testapp/utils/constant.dart';
import 'package:testapp/screens/student_dashboard.dart';

class StudentLogin extends ConsumerStatefulWidget {
  const StudentLogin({super.key});

  @override
  ConsumerState<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends ConsumerState<StudentLogin> {
  final _formKey = GlobalKey<FormState>();
  final _studentIdController = TextEditingController();
  final _studentPasswordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                Image.network(
                  "https://vfpatna.com/assets/vf_logo.png",
                  height: 60,
                ),
                const SizedBox(height: 56),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Student Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color.fromARGB(255, 24, 95, 171),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Phone Input
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Enter Phone Number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 24, 95, 171),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          height: 42,
                          child: TextFormField(
                            controller: _studentIdController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: PRIMARY_COLOR,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Password Input
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 24, 95, 171),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          height: 42,
                          child: TextFormField(
                            controller: _studentPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: PRIMARY_COLOR,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Remember and Forgot
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (val) {
                                    setState(() {
                                      isChecked = val ?? false;
                                    });
                                  },
                                ),
                                const Text('Remember me'),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Forgot?'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: authState.status == AuthStatus.loading
                                ? null
                                : () async {
                                    final phone = _studentIdController.text
                                        .trim();
                                    final pass = _studentPasswordController.text
                                        .trim();

                                    if (phone.isEmpty || pass.isEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Please fill all fields',
                                          ),
                                        ),
                                      );
                                    } else {
                                      await ref
                                          .read(authControllerProvider.notifier)
                                          .login(phone, pass);

                                      final updatedAuth = ref.read(
                                        authControllerProvider,
                                      );
                                      if (updatedAuth.status ==
                                          AuthStatus.success) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const StudentDashboard(),
                                          ),
                                        );
                                      } else if (updatedAuth.status ==
                                          AuthStatus.error) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              updatedAuth.errorMessage ??
                                                  'Login failed',
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                24,
                                95,
                                171,
                              ),
                              foregroundColor: Colors.white,
                            ),
                            child: authState.status == AuthStatus.loading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text("Login"),
                          ),
                        ),

                        const SizedBox(height: 8),
                      ],
                    ),
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
