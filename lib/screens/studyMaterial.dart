import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Studymaterial extends ConsumerStatefulWidget {
  const Studymaterial({super.key});

  @override
  ConsumerState<Studymaterial> createState() => _StudymaterialState();
}

class _StudymaterialState extends ConsumerState<Studymaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Studdymaterial'));
  }
}
