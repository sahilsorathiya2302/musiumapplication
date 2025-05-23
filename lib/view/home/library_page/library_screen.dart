import 'package:flutter/material.dart';
import 'package:musiumapplication/view/home/library_page/widget/library_header_widget.dart';
import 'package:musiumapplication/view/home/library_page/widget/search_widget.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({
    super.key,
  });

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool open = false;
  void searchBarOpen(bool isOpen) {
    setState(() {
      open = isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Column(
            children: [
              LibraryHeaderWidget(
                onSearchTap: searchBarOpen,
              ),
              // const FilterWidget().paddingSymmetric(horizontal: 15, vertical: 5),
              SearchWidget(
                isOpen: open,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
