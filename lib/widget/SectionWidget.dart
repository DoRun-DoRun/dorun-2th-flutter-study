// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/item.dart';
// import '../model/section.dart';
// import '../model/section_height.dart';
//
// class SectionWidget extends StatelessWidget {
//   final Section section;
//   final List<Item> listItems = [];
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<SectionHeightModel>(context, listen: false);
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.fastOutSlowIn, //애니메이션 효과
//       height: provider.sectionHeights[section.index],
//       child: Container(
//         color: section.backgroundColor,
//         alignment: Alignment.topLeft,
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //섹션별 제목
//               GestureDetector(
//                 onTap: () { provider.toggleSectionHeight(section.index); },
//                 child: Text(
//                   section.title,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline1!
//                       .copyWith(color: section.textColor),
//                 ),
//               ),
//               //섹션별 리스트
//               if (_listItems.isNotEmpty)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     for (var item in _listItems)
//                       if (item.index == section.index) _todoItem(item),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }