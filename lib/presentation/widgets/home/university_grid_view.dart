// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tyba_test/domain/entities/university_entity.dart';
import 'package:tyba_test/presentation/pages/university_detail_page.dart';
import 'package:tyba_test/presentation/widgets/common/university_bottom_loader.dart';
import 'package:tyba_test/presentation/widgets/common/university_card.dart';
import 'package:tyba_test/presentation/widgets/home/university_scroll_layout.dart';

class UniversityGridView extends StatefulWidget {
  final bool hasReachedMax;
  final List<University> universities;
  const UniversityGridView({
    Key? key,
    required this.universities,
    required this.hasReachedMax,
  }) : super(key: key);

  @override
  _UniversityGridViewState createState() => _UniversityGridViewState();
}

class _UniversityGridViewState extends State<UniversityGridView> {
  final _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    final _length = widget.universities.length;
    return UniversityScrollLayout.gridView(
      child: GridView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          mainAxisExtent: 100,
        ),
        itemCount: widget.hasReachedMax ? _length : _length + 1,
        itemBuilder: (context, int index) {
          if (index >= _length) return UniversityBottomLoader();
          return UniversityCard(
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
