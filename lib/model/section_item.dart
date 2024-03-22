class SectionItem {
  String title;
  int index; //1: To Do, 2: To Schedule, 3: To Delegate, 4: To Delete
  bool completed; //완료 여부

  SectionItem({required this.title, required this.index, this.completed = false});
}