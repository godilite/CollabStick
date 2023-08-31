import 'package:colab/src/features/sticky_notes/sticky_note_card.dart';
import 'package:flutter/material.dart';

class StickyNotesPage extends StatefulWidget {
  const StickyNotesPage({super.key});

  @override
  State<StickyNotesPage> createState() => _StickyNotesPageState();
}

class _StickyNotesPageState extends State<StickyNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Container(
            width: 50,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(1, 4),
              )
            ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.touch_app_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.sticky_note_2_outlined),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: Stack(
              fit: StackFit.expand,
              children: const [
                StickyNoteCard(
                  color: Colors.red,
                ),
                // StickyNoteCard(
                //   color: Colors.green,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
