import 'package:flutter/material.dart';

import '../model/section.dart';
import '../model/section_item.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  String _textFieldValue = ''; // TextField의 값을 저장할 변수
  int _selectedIndex = Section.toDo.index; // RadioButton 값을 저장할 변수
  final FocusNode _focusNode = FocusNode(); // TextField에 포커스를 주기 위한 변수
  //buildcontext 전역 변수 생성
  late BuildContext context;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus(); //화면이 그려진 후 TextField에 포커스를 줌
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); //화면이 사라지면 FocusNode를 해제
    super.dispose();
  }

  void _setSelectedIndex(int? index) {
    setState(() {
      _selectedIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        bottom: PreferredSize(
          //AppBar의 하단에 선을 추가
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            color: Colors.black, //라인 색상
            height: 2.0, //라인 두께
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('What to do?',
                style: Theme.of(context).textTheme.headline2),
          ),

          /// 할일 텍스트 입력받기 위한 TextField 위젯
          TextField(
            focusNode: _focusNode, //포커스를 주기 위한 FocusNode
            decoration: const InputDecoration(
              hintText: 'What are you planning to do?',
              hintStyle: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            onChanged: (value) {
              setState(() {
                _textFieldValue = value; //TextField의 값을 저장
              });
            },
          ),
          const SizedBox(height: 40.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('How important it is?',
                style: Theme.of(context).textTheme.headline2),
          ),

          /// RadioList 위젯 추가
          for (var importance in Section.values)
            _radioButton(
              context,
              importance.index,
              importance.title,
              importance.subtitle,
            ),
          const SizedBox(height: 20.0),

          /// Create 버튼 위젯
          _createButton(),
        ]),
      ),
    );
  }

  /// RadioList 위젯
  Widget _radioButton(
    BuildContext context,
    int index,
    String title,
    String subtitle,
  ) {
    return RadioListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline3),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
      value: index,
      groupValue: _selectedIndex,
      onChanged: _setSelectedIndex,
      controlAffinity: ListTileControlAffinity.trailing,
      // 라디오 버튼을 오른쪽에 배치
      contentPadding: EdgeInsets.zero, // 좌우 padding을 없애기
    );
  }

  /// Create 버튼 위젯
  Widget _createButton() {
    return Container(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pop(
            context,
            SectionItem(
              title: _textFieldValue,
              index: _selectedIndex,
              completed: false,
            ), // Item 객체를 생성하여 반환
          );
        },
        style: ButtonStyle(
          //버튼 테두리 설정
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          //버튼 모양 설정
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0, //모서리를 둥글기 조절
              ),
            ),
          ),
          // 버튼 사이즈 설정
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(
              double.infinity, //가로폭을 꽉 채우기
              60,
            ),
          ),
        ),
        child: Text(
          'Create', //버튼명
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
