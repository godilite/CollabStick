import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';

class StickyNoteCard extends StatefulWidget {
  final Color color;
  const StickyNoteCard({super.key, required this.color});

  @override
  State<StickyNoteCard> createState() => _StickyNoteCardState();
}

class _StickyNoteCardState extends State<StickyNoteCard> {
  late Rect rect = Rect.fromCenter(
    center: MediaQuery.of(context).size.center(Offset.zero),
    width: 400,
    height: 300,
  );

  @override
  Widget build(BuildContext context) {
    return TransformableBox(
      rect: rect,
      cornerHandleBuilder: (context, handle) => const SizedBox.shrink(),
      sideHandleBuilder: (context, position) => const SizedBox.shrink(),
      clampingRect: Offset.zero & MediaQuery.of(context).size,
      onChanged: (result) {
        setState(() {
          rect = result.rect;
        });
      },
      contentBuilder: (context, rect, flip) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: widget.color,
            child: EditableText(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              cursorColor: Theme.of(context).colorScheme.primary,
              backgroundCursorColor: Theme.of(context).colorScheme.primary,
              maxLines: null,
              minLines: null,
              expands: true,
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              forceLine: true,
              onChanged: (value) {},
            ),
          ),
        );
      },
    );
  }
}
