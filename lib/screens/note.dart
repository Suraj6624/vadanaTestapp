import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/utils/constant.dart';
import 'package:testapp/widgets/appbar.dart';
import 'package:testapp/widgets/my_bottom_bar.dart';
import 'package:testapp/widgets/note_study.dart';

class Notes extends ConsumerStatefulWidget {
  const Notes({super.key});

  @override
  ConsumerState<Notes> createState() => _NotesState();
}

class _NotesState extends ConsumerState<Notes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Notes'),
        bottomNavigationBar: MyBottomBar(currentIndex: 3),
        backgroundColor: background_color,
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [PdfNoteWidget(), SizedBox(height: 12), PdfNoteWidget()],
          ),
        ),
      ),
    );
  }
}
