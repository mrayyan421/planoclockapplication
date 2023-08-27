import 'Constants.dart';
import 'package:flutter/material.dart';

void addTitle() {
  if (titleName.isNotEmpty) {
    todosTitles.add(titleName);
    titleName = ''; // Clear the input field
  }
  ;
}

String kStorePriority(int p) {
  return (todosTitles[p] == todosTitles[0])
      ? items[0]
      : (todosTitles[p] == todosTitles[1])
          ? items[1]
          : (todosTitles[p] == todosTitles[2])
              ? items[2]
              : kvalue;
}

String kStoreValue(int v) {
  return (todosTitles[v] == todosTitles[0])
      ? type[0]
      : (todosTitles[v] == todosTitles[1])
          ? items[1]
          : (todosTitles[v] == todosTitles[2])
              ? items[2]
              : ktitleType;
}

String kStoreType(int t) {
  return (todosTitles[t] == todosTitles[0])
      ? type[0]
      : (todosTitles[t] == todosTitles[1])
          ? type[1]
          : (todosTitles[t] == todosTitles[2])
              ? type[2]
              : ktitleType;
}

String kS2ContainerDisplay(int s2) {
  return (todosTitles[s2] == todosTitles[0])
      ? todosTitles[0]
      : (todosTitles[s2] == todosTitles[1])
          ? todosTitles[1]
          : (todosTitles[s2] == todosTitles[2])
              ? todosTitles[2]
              : titleName;
}

String kDisplayDetails(int d) {
  return (todosTitles[d] == todosTitles[0])
      ? todoDetails[0]
      : (todosTitles[d] == todosTitles[1])
          ? todoDetails[1]
          : (todosTitles[d] == todosTitles[2])
              ? todoDetails[2]
              : description;
}

String kDisplayStatus(int t) {
  return (todosTitles[t] == todosTitles[1])
      ? kTaskStatus[0]
      : (todosTitles[t] == todosTitles[2])
          ? kTaskStatus[1]
          : (todosTitles[t] == todosTitles[2])
              ? kTaskStatus[2]
              : kProgress;
}

DateTime kDisplayDueDate(int dd) {
  return (todosTitles[dd] == todosTitles[1])
      ? kDdateArray[0]
      : (todosTitles[dd] == todosTitles[2])
          ? kDdateArray[1]
          : (todosTitles[dd] == todosTitles[2])
              ? kDdateArray[2]
              : selectedEndDate;
}

DateTime kStoreDate(int ss) {
  return (todosTitles[ss] == todosTitles[1])
      ? kDdateArray[0]
      : (todosTitles[ss] == todosTitles[2])
          ? kDdateArray[1]
          : (todosTitles[ss] == todosTitles[2])
              ? kDdateArray[2]
              : selectedEndDate;
}

// TimeOfDay kStoreTime(int st) {
//   return (todosTitles[st] == todosTitles[0])
//       ? kDtimeArray[0]
//       : (todosTitles[st] == todosTitles[1])
//           ? kDtimeArray[1]
//           : (todosTitles[st] == todosTitles[2])
//               ? kDtimeArray[2]
//               : endTime;
// }

// void navBarInteractions() {
//   if (navBarTouch == 'Complete'&&todosTitles[0]==items[0]) {
//     onPress: () {
//       setState(() {
//         Color(0xFFffffff);
//
//       });
//     },
//   }
// }

// void addType() {
//   if (ktitleType.isNotEmpty) {
//     type.contains(ktitleType);
//   }
// }

// Map<String, String> titleToDetails = {
//   todosTitles[0]: todoDetails[0],
//   todosTitles[1]: todoDetails[1],
//   todosTitles[2]: todoDetails[2],
// };
//
// String displayedTodoDetails = titleToDetails[titleName] ?? '';
