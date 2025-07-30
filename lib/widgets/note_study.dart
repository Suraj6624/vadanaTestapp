import 'package:flutter/material.dart';
import 'package:testapp/utils/constant.dart';

class PdfNoteWidget extends StatelessWidget {
  const PdfNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), // Padding of container
      decoration: BoxDecoration(
        color: PRIME_WHITE,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PRIMAY_BLACK),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 📄 PDF Icon
          Icon(
            Icons.picture_as_pdf,
            color: Colors.red,
            size: 40, // height of icon
          ),
          const SizedBox(width: 12),

          // 📑 Column with Title & Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Sample Note PDF",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "20 July 2025",
                  style: TextStyle(fontSize: 14, color: PRIMAY_BLACK),
                ),
              ],
            ),
          ),

          // ⬇ Download Icon
          IconButton(
            onPressed: () {
              // download logic
            },
            icon: const Icon(Icons.download, color: PRIME_BLUE, size: 28),
          ),
        ],
      ),
    );
  }
}
