import 'package:dart_algorithm/merge_sort.dart';
import 'package:dart_algorithm/quick_sort.dart';
import 'package:dart_algorithm/heap_sort.dart';
import 'package:test/test.dart';

void main() {
  test('merge sort', () {
    expect(mergeSort(<int>[]), <int>[]);
    expect(mergeSort([1]), [1]);
    expect(mergeSort([1, 10, 3, 5, 2], true), [1, 2, 3, 5, 10]);
    expect(mergeSort([1, 10, 3, 5, 2], false), [10, 5, 3, 2, 1]);
  });

  test('quick sort', () {
    expect(quickSort(<int>[]), <int>[]);
    expect(quickSort([1]), [1]);
    expect(quickSort([1, 10, 3, 5, 2], true), [1, 2, 3, 5, 10]);
    expect(quickSort([1, 10, 3, 5, 2], false), [10, 5, 3, 2, 1]);
  });

  test('heap sort', () {
    expect(heapSort(<int>[]), <int>[]);
    expect(heapSort([1]), [1]);
    expect(heapSort([1, 10, 3, 5, 2], true), [1, 2, 3, 5, 10]);
    expect(heapSort([1, 10, 3, 5, 2], false), [10, 5, 3, 2, 1]);
  });
}
