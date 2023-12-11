import 'package:flutter/material.dart';

class SearchFilterWidget extends StatefulWidget {
  const SearchFilterWidget({
    super.key,
    required this.child,
    required this.onSearch,
  });

  final Widget child;
  final void Function(String searchText) onSearch;

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  final textEC = TextEditingController();
  bool showTextField = false;

  void toggleShow() {
    if (showTextField && textEC.text.isNotEmpty) {
      widget.onSearch(textEC.text);
    }

    setState(() {
      showTextField = !showTextField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: toggleShow,
        ),
        if (!showTextField)
          widget.child
        else
          Expanded(
            child: TextField(
              controller: textEC,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                isDense: true,
                hintText: ' Pesquisar...',
                contentPadding: EdgeInsets.all(8)
              ),
            ),
          ),
      ],
    );
  }
}
