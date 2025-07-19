import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;
  const InfoTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Theme.of(context).disabledColor),
      ),
      subtitle: Text(
        value,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: onTap != null ? Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
}
