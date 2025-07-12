import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/color_constants.dart';

class SearchContainer extends StatelessWidget {
  final String label;
  final VoidCallback onSearchPressed;
  final VoidCallback? onFilterPressed;
  const SearchContainer({
    super.key,
    required this.label,
    required this.onSearchPressed,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSearchPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstants.onSearch,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(36, 0, 0, 0), // цвет тени
              spreadRadius: 2, // насколько тень растекается
              blurRadius: 6, // степень размытия
              offset: Offset(0, 3), // смещение по x и y
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.search), onPressed: onSearchPressed),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            if (onFilterPressed != null) ...[
              SizedBox(height: 26, child: VerticalDivider()),
              IconButton(
                onPressed: onFilterPressed,
                icon: Icon(Icons.filter_alt_outlined),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// SearchBar(
//       onTap: onSearchPressed,
//       elevation: WidgetStatePropertyAll(0.5),
//       backgroundColor: WidgetStatePropertyAll(Color(0xFFF2F2F2)),
//       leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//       hintText: 'Поиск',
//       trailing: [
//         IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
//       ],
//     );
