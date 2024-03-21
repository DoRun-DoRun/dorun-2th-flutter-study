import 'dart:ui';

enum Section {
  toDo('To Do', 'Urgent, Important Things.', Color(0xFF077522),
      Color(0xFFFF8181)),
  toSchedule('To Schedule', 'Not Urgent, Important Things.',
      Color(0xFF6677BB), Color(0xFFFCE38A)),
  toDelegate('To Delegate', 'Urgent, Not Important Things.',
      Color(0xFFBA55D3), Color(0xFFEAFFD0)),
  toDelete('To Delete', 'Not Urgent, Not Important Things.',
      Color(0xFF569889), Color(0xFF95E1D3));

  final String title;
  final String subtitle;
  final Color textColor;
  final Color backgroundColor;

  const Section(
      this.title, this.subtitle, this.textColor, this.backgroundColor);
}