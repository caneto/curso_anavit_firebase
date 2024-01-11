import 'package:flutter/material.dart';

class SearchFilterWidget extends StatefulWidget {
  const SearchFilterWidget({
    super.key,
    required this.child,
    required this.onSearch,
    required this.onClose,
  });

  final Widget child;
  final void Function(String searchText) onSearch;
  final VoidCallback onClose;

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  final textEC = TextEditingController();
  final focusNode = FocusNode();
  bool showTextField = false;

  @override
  void initState() {
    super.initState();
    textEC.addListener(searchListner);
  }

  @override
  void dispose() {
    textEC.removeListener(searchListner);
    textEC.dispose();
    super.dispose();
  }

  void searchListner() {
    if(textEC.text.isEmpty) return;

    widget.onSearch(textEC.text);
  }

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
    widget.onClose();

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
                border: InputBorder.none,
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
