import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // ✅ Import Riverpod
import 'package:testapp/vadantasplash.dart';

void main() {
  runApp(
    const ProviderScope(
      // ✅ Wrap your app in ProviderScope
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SliderRightTransitionBuilder(),
            TargetPlatform.iOS: SliderRightTransitionBuilder(),
          },
        ),
      ),
      home: Vadantasplash(),
    );
  }
}

class SliderRightTransitionBuilder extends PageTransitionsBuilder {
  const SliderRightTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // slide in from right
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
