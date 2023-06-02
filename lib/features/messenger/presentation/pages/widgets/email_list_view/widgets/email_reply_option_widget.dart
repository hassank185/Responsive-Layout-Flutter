import 'package:flutter/material.dart';

class EmailReplyOptions extends StatefulWidget {
  const EmailReplyOptions({super.key});

  @override
  State<EmailReplyOptions> createState() => _EmailReplyOptionsState();
}

class _EmailReplyOptionsState extends State<EmailReplyOptions> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 100) {
          return const SizedBox.shrink();
        }
        return Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(_colorScheme.onInverseSurface),
                ),
                onPressed: () {},
                child: Text(
                  'Reply',
                  style: TextStyle(color: _colorScheme.onSurfaceVariant),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(_colorScheme.onInverseSurface),
                ),
                onPressed: () {},
                child: Text(
                  'Reply All',
                  style: TextStyle(color: _colorScheme.onSurfaceVariant),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}