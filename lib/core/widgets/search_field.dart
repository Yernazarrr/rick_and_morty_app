import 'package:flutter/material.dart';

/// Скруглённое поле поиска, используемое на экранах со списками.
class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.onFilterTap,
    this.controller,
  });

  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback? onFilterTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: onFilterTap == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalDivider(indent: 12, endIndent: 12, width: 1),
                  IconButton(
                    icon: const Icon(Icons.tune_rounded),
                    onPressed: onFilterTap,
                  ),
                ],
              ),
      ),
    );
  }
}
