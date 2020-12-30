import 'dart:math';

/// Runs simplified heap sort algorithm in a nondestructive way.
List<T> heapSort<T extends Comparable>(List<T> l, [bool isAscending = false]) {
  if (l.length < 2) return l;

  var r = [...l];
  for (var i=r.length-1; i>0; i--) {
    var parent = (i-1)~/2;
    if (r[i].compareTo(r[parent]) == (isAscending ? -1 : 1)) {
      var tmp = r[parent];
      r[parent] = r[i];
      r[i] = tmp;
    }
  }
  return [r[0], ...heapSort(r.sublist(1), isAscending)];
}
