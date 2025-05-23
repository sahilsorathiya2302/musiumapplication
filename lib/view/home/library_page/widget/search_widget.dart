import 'package:flutter/material.dart';
import 'package:musiumapplication/view/home/explore_page/widget/search_bar_widget.dart';
import 'package:musiumapplication/view/home/library_page/widget/song_show_widget.dart';

class SearchWidget extends StatefulWidget {
  final bool isOpen;
  const SearchWidget({super.key, required this.isOpen});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar Input Field
        widget.isOpen
            ? SearchBarWidget(
                controller: searchValue,
                onChanged: (value) {
                  setState(() {}); // Refresh UI when search text changes
                },
              )
            : const SizedBox(),

        SongShowWidget(searchData: searchValue.text),
      ],
    );
  }
}
