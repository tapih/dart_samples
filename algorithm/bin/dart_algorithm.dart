import 'dart:web_gl';

import 'package:dart_algorithm/merge_sort.dart';

void main(List<String> arguments) {
  var l =  [2, 10, 3, 5, 1];
  print(l);
  print(mergeSort(l, false));
  print(mergeSort(l, true));
  print(mergeSort(l, null));
}
