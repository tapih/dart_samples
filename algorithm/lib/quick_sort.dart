/// Runs quick sort algorithm in a nondestructive way.
List<T> quickSort<T extends Comparable>(List<T> l, [bool isAscending = false]) {
  if (l.length < 2) {
    return l;
  }

  var r = [...l];
  var left = 0;
  var right = r.length - 1;
  // This code does not avoid O(N^2)
  var pivot = r[r.length ~/ 2];

  while (true) {
    while (left < right && r[left].compareTo(pivot) == (isAscending ? -1 : 1)) {
      left++;
    }
    while (
        left < right && r[right].compareTo(pivot) == (isAscending ? 1 : -1)) {
      right--;
    }

    if (left >= right) {
      break;
    }
    r[left] = l[right];
    r[right] = l[left];
    left++;
    right--;
  }
  return [
    ...quickSort(r.sublist(0, left), isAscending),
    ...quickSort(r.sublist(left), isAscending)
  ];
}
