import 'package:dorun_2th_flutter_study/model/section_height.dart';
import 'package:dorun_2th_flutter_study/model/section_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/section.dart';
import 'create_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SectionHeightModel? sectionHeightModel;
  final List<SectionItem> _listItems = []; //Item 클래스의 리스트 생성

  @override
  void initState() {
    super.initState();
    // 화면 그려지고 난 뒤, 화면 높이를 기반으로 SectionHeightModel을 초기화합니다.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      sectionHeightModel = SectionHeightModel(screenHeight);
      setState(() {}); // SectionHeightModel이 준비되었다는 것을 알리기 위해 상태 업데이트
    });
  }

  //리스트에 Item 추가
  void _addListItem(SectionItem item) {
    setState(() {
      _listItems.add(item);
    });
  }

  //아이템 추가 화면으로 이동 및 추가된 아이템을 리스트에 추가
  void _moveToCreateScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateScreen()),
    ).then((result) {
      if (result != null) {
        _addListItem(result as SectionItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (sectionHeightModel == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), //로딩 중 표시
        ),
      );
    }
    //provider로 섹션 높이 가져오기
    return ChangeNotifierProvider<SectionHeightModel>.value(
      value: sectionHeightModel!,
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //       onPressed: _moveToCreateScreen,
        //       icon: Icon(Icons.add),
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: _moveToCreateScreen,
          child: Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var section in Section.values) _textSection(section),
          ],
        ),
      ),
    );
  }

  /// 각 섹션별로 텍스트와 리스트를 표시
  Widget _textSection(Section section) {
    //provider로 섹션 높이 가져오기
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn, //애니메이션 효과
        height: sectionHeightModel!.sectionHeights[section.index],
        child: GestureDetector(
          onTap: () {
            // 섹션 펼치기 및 접기
            setState(() {
              sectionHeightModel!.toggleSectionHeight(section.index);
            });
          },
          child: Container(
            color: section.backgroundColor,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //섹션별 제목
                    Text(
                      section.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: section.textColor),
                    ),
                    //섹션별 리스트
                    if (_listItems.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var item in _listItems)
                            if (item.index == section.index) _todoItem(item),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  /// 추가된 item
  Widget _todoItem(SectionItem item) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          _listItems.remove(item);
        });
      },
      child: GestureDetector(
        //탭하면 완료 여부 변경
        onTap: () {
          setState(() {
            item.completed = !item.completed;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10), //상단에 간격 추가
          child: Text(
            item.title,
            style: item.completed //완료된 항목은 취소선
                ? Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(decoration: TextDecoration.lineThrough)
                : Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
