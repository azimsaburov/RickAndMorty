import 'package:flutter/material.dart';

class TotalCountWidget extends StatelessWidget {
  final String title;
  final int amount;
  const TotalCountWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title: $amount',
      style: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(color: Theme.of(context).disabledColor),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
