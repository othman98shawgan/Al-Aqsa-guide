import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final Widget content;

  InfoCard({
    this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final hasTitle = title != null && title!.trim().isNotEmpty;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasTitle)
            Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          if (hasTitle)
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 2,
            ),
          if (hasTitle) const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }
}
