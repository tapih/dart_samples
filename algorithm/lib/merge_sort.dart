/// Runs merge sort algorithm in a nondestructive way.
List<T> mergeSort<T extends Comparable>(List<T> l, [bool isAscending = false]) {
  if (l.length < 2) {
    return l;
  }
  var middle = l.length ~/ 2;
  var left = mergeSort(l.sublist(0, middle), isAscending);
  var right = mergeSort(l.sublist(middle), isAscending);
  return _merge(left, right, isAscending);
}

List<T> _merge<T extends Comparable>(List<T> a, List<T> b, bool isAscending) {
  if (a.isEmpty) return b;
  if (b.isEmpty) return a;
  var r = List.filled(a.length + b.length, a[0]);
  var ai = 0;
  var bi = 0;
  var ri = 0;
  while (a.length > ai && b.length > bi) {
    if (a[ai].compareTo(b[bi]) == (isAscending ? -1 : 1)) {
      r[ri] = a[ai];
      ai++;
    } else {
      r[ri] = b[bi];
      bi++;
    }
    ri++;
  }

  while (a.length > ai) {
    r[ri] = a[ai];
    ai++;
    ri++;
  }
  while (b.length > bi) {
    r[ri] = b[bi];
    bi++;
    ri++;
  }
  return r;
}
