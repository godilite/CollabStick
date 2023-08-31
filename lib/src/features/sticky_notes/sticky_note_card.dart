import 'package:auto_size_text_field/auto_size_text_field.dart';
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

  final _controller = TextEditingController();
  final transformConroller = TransformableBoxController();

  @override
  Widget build(BuildContext context) {
    return TransformableBox(
      rect: rect,
      cornerHandleBuilder: (context, handle) => const SizedBox.shrink(),
      sideHandleBuilder: (context, position) => const SizedBox.shrink(),
      clampingRect: Offset.zero & MediaQuery.of(context).size,
      flipWhileResizing: false,
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
            alignment: Alignment.center,
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            color: widget.color,
            child: LayoutBuilder(builder: (context, size) {
              final style = TextStyle(
                color: Theme.of(context).colorScheme.primary,
              );
              TextSpan text = TextSpan(text: _controller.text, style: style);

              TextPainter tp = TextPainter(
                text: text,
                maxLines: 1,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
              );
              tp.layout(maxWidth: size.maxWidth);

              final exceeded = tp.didExceedMaxLines;
              print(tp.size.height);
              int lines = (tp.size.height / tp.preferredLineHeight).ceil();
              int maxLines = 1;

              return SizedBox(
                width: rect.width,
                height: rect.height,
                child: AutoSizeTextField(
                  textAlign: TextAlign.center,
                  minLines: null,
                  minFontSize: 30,
                  scrollPadding: EdgeInsets.zero,
                  overflowReplacement: Text('...'),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  controller: _controller,
                  focusNode: FocusNode(),
                  style: style,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  maxLines: null,
                  textDirection: TextDirection.ltr,
                  onChanged: (value) {
                    print(exceeded);
                    if (exceeded) {
                      print('above ${rect.height}');

                      setState(() {
                        rect = Rect.fromLTWH(rect.left, rect.top, rect.width, rect.height + 48);
                      });
                    }
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
