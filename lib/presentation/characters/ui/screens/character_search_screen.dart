import 'package:flutter/material.dart';

class CharacterSearchScreen extends StatefulWidget {
  const CharacterSearchScreen({super.key});

  @override
  State<CharacterSearchScreen> createState() => _CharacterSearchScreenState();
}

class _CharacterSearchScreenState extends State<CharacterSearchScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              TextField(
                controller: controller,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => controller.clear(),
                  ),
                ),
              ),
              Text(
                'РЕЗУЛЬТАТЫ ПОИСКА',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(),
                  itemCount: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
