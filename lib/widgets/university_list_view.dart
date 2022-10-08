// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/models/university_model.dart';
import 'package:tyba_test/pages/university_detail_page.dart';
import 'package:tyba_test/widgets/university_bottom_loader.dart';
import 'package:tyba_test/widgets/university_scroll_layout.dart';
import 'package:tyba_test/widgets/university_tile.dart';

class UniversityListView extends StatefulWidget {
  final bool hasReachedMax;
  final List<UniversityModel> universities;
  const UniversityListView({
    Key? key,
    required this.universities,
    required this.hasReachedMax,
  }) : super(key: key);

  @override
  _UniversityListViewState createState() => _UniversityListViewState();
}

class _UniversityListViewState extends State<UniversityListView> {
  final _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final _length = widget.universities.length;
    return UniversityScrollLayout.listView(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.hasReachedMax ? _length : _length + 1,
        itemBuilder: (context, int index) {
          if (index >= _length) return UniversityBottomLoader();
          return UniversityTile(
            university: widget.universities[index],
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return UniversityDetailPage(
                  university: widget.universities[index]);
            })),
          );
        },
      ),
    );
  }
}
