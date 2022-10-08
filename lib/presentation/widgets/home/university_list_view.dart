// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/domain/entities/university_entity.dart';
import 'package:tyba_test/presentation/pages/university_detail_page.dart';
import 'package:tyba_test/presentation/widgets/common/university_bottom_loader.dart';
import 'package:tyba_test/presentation/widgets/common/university_tile.dart';
import 'package:tyba_test/presentation/widgets/home/university_scroll_layout.dart';

// Project imports:

class UniversityListView extends StatefulWidget {
  final bool hasReachedMax;
  final List<University> universities;
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
