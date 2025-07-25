import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Notice extends ConsumerStatefulWidget {
  const Notice({super.key});

  @override
  ConsumerState<Notice> createState() => _NoticeState();
}

class _NoticeState extends ConsumerState<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('notice'));
  }
}
