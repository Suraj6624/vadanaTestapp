import 'package:flutter/material.dart';

import 'package:testapp/utils/constant.dart';
import 'package:testapp/screens/student_dashboard.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final _formKey = GlobalKey<FormState>();
  final _StudentIdController = TextEditingController();
  final _StudentPassword = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 50, right: 20, bottom: 20, left: 20),

            child: Column(
              children: [
                Container(
                  child: Image.network(
                    "https://vfpatna.com/assets/vf_logo.png",
                    height: 60,
                  ),
                ),
                SizedBox(height: 56),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Student Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Color.fromARGB(255, 24, 95, 171),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Enter Vedanta ID',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 24, 95, 171),
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 42,
                          child: TextFormField(
                            controller: _StudentIdController,

                            decoration: InputDecoration(
                              hint: Text("Student Id Number"),
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.05),
                              ),
                              prefixIcon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.perm_identity,
                                  color: PRIMARY_COLOR,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 24, 95, 171),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 24, 95, 171),
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 42,
                          width: double.infinity,
                          child: TextFormField(
                            controller: _StudentPassword,

                            decoration: InputDecoration(
                              hint: Text("Password"),
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.05),
                              ),
                              prefixIcon: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.password,
                                  color: PRIMARY_COLOR,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 24, 95, 171),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 16),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text('Remember me', style: TextStyle()),
                                ],
                              ),

                              TextButton(
                                child: Text('Forget?'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black.withOpacity(
                                    0.6,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Login'),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 24, 95, 171),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentDashboard(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Already have an account.',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign In ?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 24, 95, 171),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16),
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
