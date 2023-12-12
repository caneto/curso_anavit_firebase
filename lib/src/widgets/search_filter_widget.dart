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
  final focusNode = FocusNode();
  bool showTextField = false;

  void toggleShow() {
    if (showTextField && textEC.text.isNotEmpty) {
      return widget.onSearch(textEC.text);
    }

    setState(() {
      showTextField = !showTextField;
    });

    if (showTextField) focusNode.requestFocus();
  }

  void clear() {
    textEC.clear();
    toggleShow();

    FocusScope.of(context).requestFocus();
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
        const SizedBox(height: 8),
        if (!showTextField)
          widget.child
        else
          Expanded(
            child: TextField(
              controller: textEC,
              focusNode: focusNode,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isDense: true,
                hintText: ' Pesquisar...',
                contentPadding: const EdgeInsets.all(8),
                suffixIcon: InkWell(
                  onTap: clear,
                  child: const Icon(Icons.close),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
