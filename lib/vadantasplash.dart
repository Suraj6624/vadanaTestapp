import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/providers/get_auth_token.dart';
import 'package:testapp/screens/student_dashboard.dart';

import 'package:testapp/screens/vadanta_login_page.dart';
import 'package:testapp/utils/constant.dart';
// import 'package:testapp/screens/MainPageWithBottomNav .dart';

class Vadantasplash extends ConsumerStatefulWidget {
  const Vadantasplash({super.key});

  @override
  ConsumerState<Vadantasplash> createState() => _VadantasplashState();
}

class _VadantasplashState extends ConsumerState<Vadantasplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () async {
      if (mounted) {
        final token = await ref.read(getAuthTokenProvider.future);

        if (token == null || token.isEmpty) {
          // No token, go to login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const StudentLogin()),
          );
        } else {
          // Token exists, go to dashboard (replace with your target screen)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const StudentDashboard()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIME_WHITE,
      body: SafeArea(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(
              'assets/images/vadanta_logo.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image failed to load');
              },
            ),
          ),
        ),
      ),
    );
  }
}
