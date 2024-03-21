import 'package:flutter/cupertino.dart';

// Provider 패키지에서 ChangeNotifier 클래스를 상속받아 사용
// ChangeNotifier 클래스는 상태가 변경될 때마다 리스너들에게 알림을 보내는 기능을 제공
// 이를 통해 상태가 변경될 때마다 화면을 다시 그리도록 할 수 있음
// SectionHeightModel 클래스는 화면 높이와 섹션별 높이를 저장하고, 섹션 높이를 변경하는 메서드를 제공
class SectionHeightModel with ChangeNotifier {
  double _screenHeight; // 화면 높이
  List<double> _sectionHeights = []; // 섹션별 높이

  SectionHeightModel(double screenHeight)
      : _screenHeight = screenHeight,
        _sectionHeights = List.filled(4, screenHeight * 0.25);

  List<double> get sectionHeights => _sectionHeights;

  // 섹션 높이를 변경하는 메서드
  void toggleSectionHeight(int index) {
    // 선택된 섹션 높이가 _screenHeight * 0.25보다 크면 0.25로, 작으면 0.5로 변경
    _sectionHeights[index] = _sectionHeights[index] == _screenHeight * 0.25
        ? _screenHeight * 0.5
        : _screenHeight * 0.25;
    // 다른 섹션 높이는 (_screenHeight - 선택된 섹션 높이) / 3로 변경
    for (int i = 0; i < 4; i++) {
      if (i != index) {
        _sectionHeights[i] = (_screenHeight - _sectionHeights[index]) / 3;
      }
    }
    notifyListeners();
  }
}